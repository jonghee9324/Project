import numpy as np
import tensorflow as tf
import matplotlib.pyplot as plt

###Data Handling###

# x : -1 /  o : 1 / b : 0 / true : (1,0), false : (0,1)
data_all = np.genfromtxt('data1.csv', delimiter=',', dtype=np.float32)

np.random.shuffle(data_all)

#데이터 나누기 6:4 
train_num = int(len(data_all)*0.6)
test_num = len(data_all)-train_num

data_train = data_all[:train_num]
data_test = data_all[train_num:]
x_train = data_train[:, 0:9]
y_train = data_train[:, 9:11]
x_test = data_test[:, 0:9]
y_test = data_test[:, 9:11]
    
    

#학습 데이터 설정
iteration = 20000
learning_rate = 0.1

X = tf.placeholder(tf.float32, [None, 9])
Y = tf.placeholder(tf.float32, [None, 2])


#입력 ~ layer1 
W = tf.Variable(tf.random_normal([9,100]))
B = tf.Variable(tf.random_normal([100]))
layer1 = tf.sigmoid(tf.matmul(X, W)+B) 

#layer1 ~ layer2 
W2 = tf.Variable(tf.random_normal([100,50]))
B2 = tf.Variable(tf.random_normal([50]))
layer2 = tf.sigmoid(tf.matmul(layer1, W2)+B2)

#layer2 ~ 출력 
W3 = tf.Variable(tf.random_normal([50,2]))
B3 = tf.Variable(tf.random_normal([2]))
result = tf.matmul(layer2, W3)+B3

#sigmoid
#hypothesis = tf.sigmoid(result)
#softmax
hypothesis = tf.nn.softmax(result)

#MSE 
cost = tf.reduce_mean(tf.square(hypothesis-Y))
#sotfmax를 사용한 Cross-Entropy
#cost = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(logits=result, labels=Y))

#Adam
#train = tf.train.AdamOptimizer(learning_rate).minimize(cost)
#SGD
train = tf.train.GradientDescentOptimizer(learning_rate).minimize(cost)
#RMSprop
#train = tf.train.RMSropOptimizer(learning_rate,0.9).minimize(cost)


# 출력층이 1개일 때
#predicted = tf.cast(hypothesis > 0.5, dtype=tf.float32)


# 출력층이 2개 이상일 때
predicted = tf.argmax(hypothesis, 1)
correct_prediction = tf.equal(predicted, tf.argmax(Y, 1))
accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))

#교육 데이터와 실제 값 비교한 결과값(얼마나 실제값과 비슷했는가) / 출력층이 1개일 때
#accuracy = tf.reduce_mean(tf.cast(tf.equal(predicted, Y), dtype=tf.float32))


cost_list = []
accu_list = []

with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())

    for step in range(iteration):
        sess.run(train, feed_dict={X: x_train, Y: y_train})
        c , a= sess.run([cost, accuracy], feed_dict={X: x_train, Y: y_train})
        accu_list.append(a)
        cost_list.append(c)        
        
        if step % 1000 == 0:
            print(step, sess.run(cost, feed_dict={X: x_train, Y: y_train}), sess.run([W, W2, W3]))
    
    h, a = sess.run([hypothesis, accuracy],feed_dict={X: x_test, Y: y_test})
    print("\nTest_Hypothesis: ", h, "\nTest_Accuracy: ", a)
    h, a = sess.run([hypothesis, accuracy],feed_dict={X: x_train, Y: y_train})
    print("\nTrain_Hypothesis: ", h, "\nTrain_Accuracy: ", a)

    plt.plot(range(iteration), cost_list)
    plt.plot(range(iteration), accu_list)
    plt.show()

    


