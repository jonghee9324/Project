package com.example.moble_porject;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.WindowManager;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    int gamelevel = 3;

    /* access modifiers changed from: protected */
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView((int) C0046R.layout.activity_main);
        overridePendingTransition(0, 0);
        final RadioGroup rg = (RadioGroup) findViewById(C0046R.C0048id.levelgroup);
        rg.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {
            public void onCheckedChanged(RadioGroup radioGroup, int i) {
                switch (rg.getCheckedRadioButtonId()) {
                    case C0046R.C0048id.rb_level1:
                        ((RadioButton) MainActivity.this.findViewById(C0046R.C0048id.rb_level1)).setBackgroundResource(C0046R.C0047drawable.radiostroke_click);
                        ((RadioButton) MainActivity.this.findViewById(C0046R.C0048id.rb_level2)).setBackgroundResource(C0046R.C0047drawable.radiostroke_unclick);
                        ((RadioButton) MainActivity.this.findViewById(C0046R.C0048id.rb_level3)).setBackgroundResource(C0046R.C0047drawable.radiostroke_unclick);
                        MainActivity.this.gamelevel = 1;
                        return;
                    case C0046R.C0048id.rb_level2:
                        ((RadioButton) MainActivity.this.findViewById(C0046R.C0048id.rb_level2)).setBackgroundResource(C0046R.C0047drawable.radiostroke_click);
                        ((RadioButton) MainActivity.this.findViewById(C0046R.C0048id.rb_level1)).setBackgroundResource(C0046R.C0047drawable.radiostroke_unclick);
                        ((RadioButton) MainActivity.this.findViewById(C0046R.C0048id.rb_level3)).setBackgroundResource(C0046R.C0047drawable.radiostroke_unclick);
                        MainActivity.this.gamelevel = 2;
                        return;
                    case C0046R.C0048id.rb_level3:
                        ((RadioButton) MainActivity.this.findViewById(C0046R.C0048id.rb_level3)).setBackgroundResource(C0046R.C0047drawable.radiostroke_click);
                        ((RadioButton) MainActivity.this.findViewById(C0046R.C0048id.rb_level1)).setBackgroundResource(C0046R.C0047drawable.radiostroke_unclick);
                        ((RadioButton) MainActivity.this.findViewById(C0046R.C0048id.rb_level2)).setBackgroundResource(C0046R.C0047drawable.radiostroke_unclick);
                        MainActivity.this.gamelevel = 3;
                        return;
                    default:
                        return;
                }
            }
        });
    }

    public void gamestart(View v) {
        RadioGroup radioGroup = (RadioGroup) findViewById(C0046R.C0048id.levelgroup);
        Intent game = new Intent(this, game.class);
        game.putExtra("gamelevel", this.gamelevel);
        startActivity(game);
    }

    public void showabout(View v) {
        About aboutdialog = new About(this);
        WindowManager.LayoutParams attributes = aboutdialog.getWindow().getAttributes();
        attributes.width = -1;
        attributes.height = -1;
        aboutdialog.getWindow().setAttributes(attributes);
        aboutdialog.setCancelable(true);
        aboutdialog.show();
    }
}
