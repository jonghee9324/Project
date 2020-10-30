package com.example.moble_porject;

import android.app.FragmentManager;
import android.os.Bundle;
import android.os.Handler;
import androidx.appcompat.app.AppCompatActivity;

public class logo extends AppCompatActivity implements FragmentManager.OnBackStackChangedListener {
    private boolean isShowingBackLayout = false;

    /* access modifiers changed from: protected */
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView((int) C0046R.layout.activity_logo);
        if (savedInstanceState == null) {
            getFragmentManager().beginTransaction().add(C0046R.C0048id.container, new frontfrag()).commit();
        } else {
            this.isShowingBackLayout = getFragmentManager().getBackStackEntryCount() > 0;
        }
        new Handler().postDelayed(new Runnable() {
            public void run() {
                logo.this.flipCard();
            }
        }, 500);
    }

    /* access modifiers changed from: private */
    public void flipCard() {
        if (this.isShowingBackLayout) {
            getFragmentManager().popBackStack();
            return;
        }
        this.isShowingBackLayout = true;
        getFragmentManager().beginTransaction().setCustomAnimations(C0046R.animator.cardflip_right_in, C0046R.animator.cardflip_right_out, C0046R.animator.card_flip_left_in, C0046R.animator.cardflip_left_out).replace(C0046R.C0048id.container, new backfrag()).addToBackStack((String) null).commit();
        new Handler();
    }

    public void onBackStackChanged() {
        this.isShowingBackLayout = getFragmentManager().getBackStackEntryCount() > 0;
    }
}
