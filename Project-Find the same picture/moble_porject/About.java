package com.example.moble_porject;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class About extends Dialog implements View.OnClickListener {
    Context mContext;

    public About(Context context) {
        super(context);
        this.mContext = context;
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(C0046R.layout.activity_about);
        ((Button) findViewById(C0046R.C0048id.btn_ok)).setOnClickListener(this);
    }

    public void onClick(View view) {
        dismiss();
    }
}
