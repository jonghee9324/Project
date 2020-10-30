package com.example.moble_porject;

import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.RadioButton;
import android.widget.RadioGroup;

public class backfrag extends Fragment {
    int gamelevel = 3;
    /* access modifiers changed from: private */
    public View rootview;

    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View inflate = inflater.inflate(C0046R.layout.activity_main, container, false);
        this.rootview = inflate;
        final RadioGroup rg = (RadioGroup) inflate.findViewById(C0046R.C0048id.levelgroup);
        rg.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {
            public void onCheckedChanged(RadioGroup radioGroup, int i) {
                switch (rg.getCheckedRadioButtonId()) {
                    case C0046R.C0048id.rb_level1 /*2131296402*/:
                        ((RadioButton) backfrag.this.rootview.findViewById(C0046R.C0048id.rb_level1)).setBackgroundResource(C0046R.C0047drawable.radiostroke_click);
                        ((RadioButton) backfrag.this.rootview.findViewById(C0046R.C0048id.rb_level2)).setBackgroundResource(C0046R.C0047drawable.radiostroke_unclick);
                        ((RadioButton) backfrag.this.rootview.findViewById(C0046R.C0048id.rb_level3)).setBackgroundResource(C0046R.C0047drawable.radiostroke_unclick);
                        backfrag.this.gamelevel = 1;
                        return;
                    case C0046R.C0048id.rb_level2 /*2131296403*/:
                        ((RadioButton) backfrag.this.rootview.findViewById(C0046R.C0048id.rb_level2)).setBackgroundResource(C0046R.C0047drawable.radiostroke_click);
                        ((RadioButton) backfrag.this.rootview.findViewById(C0046R.C0048id.rb_level1)).setBackgroundResource(C0046R.C0047drawable.radiostroke_unclick);
                        ((RadioButton) backfrag.this.rootview.findViewById(C0046R.C0048id.rb_level3)).setBackgroundResource(C0046R.C0047drawable.radiostroke_unclick);
                        backfrag.this.gamelevel = 2;
                        return;
                    case C0046R.C0048id.rb_level3 /*2131296404*/:
                        ((RadioButton) backfrag.this.rootview.findViewById(C0046R.C0048id.rb_level3)).setBackgroundResource(C0046R.C0047drawable.radiostroke_click);
                        ((RadioButton) backfrag.this.rootview.findViewById(C0046R.C0048id.rb_level1)).setBackgroundResource(C0046R.C0047drawable.radiostroke_unclick);
                        ((RadioButton) backfrag.this.rootview.findViewById(C0046R.C0048id.rb_level2)).setBackgroundResource(C0046R.C0047drawable.radiostroke_unclick);
                        backfrag.this.gamelevel = 3;
                        return;
                    default:
                        return;
                }
            }
        });
        ((Button) this.rootview.findViewById(C0046R.C0048id.btn_start)).setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                RadioGroup radioGroup = (RadioGroup) backfrag.this.rootview.findViewById(C0046R.C0048id.levelgroup);
                Intent game = new Intent(backfrag.this.getActivity(), game.class);
                game.putExtra("gamelevel", backfrag.this.gamelevel);
                backfrag.this.startActivity(game);
            }
        });
        ((Button) this.rootview.findViewById(C0046R.C0048id.btn_about)).setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                About aboutdialog = new About(backfrag.this.getActivity());
                WindowManager.LayoutParams attributes = aboutdialog.getWindow().getAttributes();
                attributes.width = -1;
                attributes.height = -1;
                aboutdialog.getWindow().setAttributes(attributes);
                aboutdialog.setCancelable(true);
                aboutdialog.show();
            }
        });
        return this.rootview;
    }
}
