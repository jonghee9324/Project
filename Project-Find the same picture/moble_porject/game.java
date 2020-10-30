package com.example.moble_porject;

import android.app.AlertDialog;
import android.content.res.Resources;
import android.media.SoundPool;
import android.os.Bundle;
import android.os.Handler;
import android.os.SystemClock;
import android.view.View;
import android.widget.Button;
import android.widget.Chronometer;
import android.widget.ImageView;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;

public class game extends AppCompatActivity {
    int MAX;
    int answer = 0;
    Integer[] cardimgres;
    Cardinfo[] cardinfo;
    ImageView[] choicecard = new ImageView[2];
    Chronometer chrono;
    Handler delayHandler = new Handler();
    int endsound;
    int failsound;

    /* renamed from: iv */
    ImageView[] f5iv;
    int oksound;
    int select = 2;
    SoundPool sound;
    int soundId;

    /* access modifiers changed from: protected */
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView((int) C0046R.layout.activity_game);
        overridePendingTransition(0, 0);
        int intExtra = getIntent().getIntExtra("gamelevel", 3);
        if (intExtra == 1) {
            this.MAX = 8;
        } else if (intExtra == 2) {
            this.MAX = 12;
        } else if (intExtra == 3) {
            this.MAX = 16;
        }
        settingData();
        this.chrono = (Chronometer) findViewById(C0046R.C0048id.chronometer1);
        settingGame();
        SoundPool soundPool = new SoundPool(3, 3, 0);
        this.sound = soundPool;
        this.soundId = soundPool.load(this, C0046R.raw.cardflip, 1);
        this.failsound = this.sound.load(this, C0046R.raw.fail2_nope, 1);
        this.oksound = this.sound.load(this, C0046R.raw.ok2, 1);
        this.endsound = this.sound.load(this, C0046R.raw.end, 1);
    }

    /* access modifiers changed from: package-private */
    public Integer[] imgresData() {
        return new Integer[]{Integer.valueOf(C0046R.C0047drawable.pic1), Integer.valueOf(C0046R.C0047drawable.pic2), Integer.valueOf(C0046R.C0047drawable.pic3), Integer.valueOf(C0046R.C0047drawable.pic4), Integer.valueOf(C0046R.C0047drawable.pic5), Integer.valueOf(C0046R.C0047drawable.pic6), Integer.valueOf(C0046R.C0047drawable.pic7), Integer.valueOf(C0046R.C0047drawable.pic8)};
    }

    /* access modifiers changed from: package-private */
    public void settingData() {
        int i = this.MAX;
        this.cardinfo = new Cardinfo[i];
        this.f5iv = new ImageView[i];
        for (int i2 = 0; i2 < this.cardinfo.length; i2++) {
            this.cardimgres = imgresData();
            this.cardinfo[i2] = new Cardinfo(this.cardimgres[i2 % (this.MAX / 2)].intValue(), i2 % (this.MAX / 2));
        }
    }

    /* access modifiers changed from: package-private */
    public void shuffle() {
        for (int i = 0; i < 1000; i++) {
            int index = (int) (Math.random() * ((double) (this.MAX - 1)));
            Cardinfo[] cardinfoArr = this.cardinfo;
            Cardinfo tmp = cardinfoArr[0];
            cardinfoArr[0] = cardinfoArr[index];
            cardinfoArr[index] = tmp;
        }
    }

    public void gamereset(View v) {
        this.select = 2;
        cardsetting();
        this.chrono.setBase(SystemClock.elapsedRealtime());
        this.chrono.start();
        ((Button) findViewById(C0046R.C0048id.btn_reset)).setVisibility(4);
        this.answer = 0;
        for (int i = 0; i < this.MAX; i++) {
            this.f5iv[i].setBackgroundResource(0);
            this.cardinfo[i].setClick(false);
        }
    }

    public void settingGame() {
        View.OnClickListener cardselect = new View.OnClickListener() {
            public void onClick(View v) {
                if (game.this.select >= 2) {
                    Toast.makeText(game.this, "잠시 후 다시 클릭해주세요.", 0).show();
                }
                ImageView pickcard = (ImageView) v;
                int pickcardindex = ((Integer) pickcard.getTag()).intValue();
                if (!game.this.cardinfo[((Integer) pickcard.getTag()).intValue()].getClick() && game.this.select < 2 && !game.this.cardinfo[pickcardindex].getClick()) {
                    ImageView[] imageViewArr = game.this.choicecard;
                    game game = game.this;
                    int i = game.select;
                    game.select = i + 1;
                    imageViewArr[i] = pickcard;
                    game.this.cardinfo[pickcardindex].setClick(true);
                    game.this.sound.play(game.this.soundId, 1.0f, 1.0f, 0, 0, 1.0f);
                    pickcard.setImageResource(game.this.cardinfo[pickcardindex].getImgresources());
                    if (game.this.select == 2) {
                        if (game.this.cardinfo[((Integer) game.this.choicecard[0].getTag()).intValue()].getId() == game.this.cardinfo[((Integer) game.this.choicecard[1].getTag()).intValue()].getId()) {
                            game.this.sound.play(game.this.oksound, 1.2f, 1.2f, 0, 0, 1.0f);
                            game.this.choicecard[0].setBackgroundResource(C0046R.C0047drawable.imgstroke);
                            game.this.choicecard[1].setBackgroundResource(C0046R.C0047drawable.imgstroke);
                            game.this.answer++;
                            game.this.select = 0;
                        } else {
                            game.this.sound.play(game.this.failsound, 1.2f, 1.2f, 0, 0, 1.0f);
                            game.this.delayHandler.postDelayed(new Runnable() {
                                public void run() {
                                    game.this.choicecard[0].setImageResource(C0046R.C0047drawable.card);
                                    game.this.choicecard[1].setImageResource(C0046R.C0047drawable.card);
                                    game.this.select = 0;
                                }
                            }, 300);
                            game.this.cardinfo[((Integer) game.this.choicecard[0].getTag()).intValue()].setClick(false);
                            game.this.cardinfo[((Integer) game.this.choicecard[1].getTag()).intValue()].setClick(false);
                        }
                        if (game.this.answer == game.this.MAX / 2) {
                            Button btn_reset = (Button) game.this.findViewById(C0046R.C0048id.btn_reset);
                            btn_reset.setBackgroundResource(C0046R.C0047drawable.reset);
                            btn_reset.setVisibility(0);
                            game.this.sound.play(game.this.endsound, 1.0f, 1.0f, 0, 0, 0.9f);
                            game.this.chrono.stop();
                            new AlertDialog.Builder(game.this).setMessage("클리어 시간 : " + ((SystemClock.elapsedRealtime() - game.this.chrono.getBase()) / 1000) + "초").show();
                        }
                    }
                }
            }
        };
        Resources res = getResources();
        for (int i = 0; i < this.MAX; i++) {
            ImageView[] imageViewArr = this.f5iv;
            imageViewArr[i] = (ImageView) findViewById(res.getIdentifier("iv" + (i + 1), "id", getClass().getPackage().getName()));
            imageViewArr[i].setTag(Integer.valueOf(i));
            this.f5iv[i].setOnClickListener(cardselect);
        }
        cardsetting();
    }

    public void cardsetting() {
        shuffle();
        for (int i = 0; i < this.MAX; i++) {
            this.f5iv[i].setImageResource(this.cardinfo[i].getImgresources());
            this.f5iv[i].setVisibility(0);
        }
        this.delayHandler.postDelayed(new Runnable() {
            public void run() {
                for (int i = 0; i < game.this.MAX; i++) {
                    game.this.f5iv[i].setImageResource(C0046R.C0047drawable.card);
                }
                game.this.select = 0;
                game.this.chrono.setBase(SystemClock.elapsedRealtime());
                game.this.chrono.start();
            }
        }, 2000);
    }
}
