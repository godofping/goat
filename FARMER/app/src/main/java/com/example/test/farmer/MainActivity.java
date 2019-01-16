package com.example.test.farmer;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.support.annotation.Nullable;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.webkit.JavascriptInterface;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;

import com.google.zxing.integration.android.IntentIntegrator;
import com.google.zxing.integration.android.IntentResult;

public class MainActivity extends AppCompatActivity {

    private WebView mWebView;
    ProgressDialog dialog;
    int test = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        mWebView = (WebView) findViewById(R.id.mainWebView);
        mWebView.loadUrl("http://192.168.1.6/goat/mobile/login.php");


        mWebView.setWebViewClient(new WebViewClient() {
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, String url) {

                if (url.contains("exit.php")) {
                    finish();
                    return true;
                }
                return false;

            }

            // This method will be triggered when the Page Started Loading
            @Override
            public void onPageStarted(WebView view, String url, Bitmap favicon) {

                dialog = ProgressDialog.show(MainActivity.this, null,
                        "Loading");
                    dialog.setCancelable(true);
                super.onPageStarted(view, url, favicon);
            }

            // This method will be triggered when the Page loading is completed
            @Override
            public void onPageFinished(WebView view, String url) {
                dialog.dismiss();

                super.onPageFinished(view, url);
            }

//                @Override
//                public void onLoadResource(WebView view, String url) {
//                    dialog.dismiss();
//                    super.onLoadResource(view, url);
//                }

            // This method will be triggered when error page appear
            @Override
            public void onReceivedError(WebView view, int errorCode,
                                        String description, String failingUrl) {
                dialog.dismiss();
                // You can redirect to your own page instead getting the default
                // error page
                test = 1;
                mWebView.loadUrl("file:///android_asset/index.html");
                super.onReceivedError(view, errorCode, description, failingUrl);
            }


        });


        WebSettings webSettings = mWebView.getSettings();
        webSettings.setJavaScriptEnabled(true);
        mWebView.getSettings().setCacheMode(WebSettings.LOAD_NO_CACHE);
        mWebView.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
        mWebView.addJavascriptInterface(new WebAppInterface(this), "Android");
        mWebView.setScrollBarStyle(View.SCROLLBARS_INSIDE_OVERLAY);


    }


    @Override
    public void onBackPressed() {
        if (mWebView.canGoBack() & test == 0) {
            mWebView.goBack();
        } else {
            new AlertDialog.Builder(this)
                    .setIcon(android.R.drawable.ic_dialog_alert)
                    .setTitle("Exit!")
                    .setMessage("Are you sure you want to close?")
                    .setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            finish();
                        }

                    })
                    .setNegativeButton("No", null)
                    .show();
        }
    }

    final Activity activity = this;
    public void runQrCodeScanner(){
        IntentIntegrator integrator = new IntentIntegrator(activity);
        integrator.setDesiredBarcodeFormats(IntentIntegrator.QR_CODE_TYPES);
        integrator.setPrompt("Scan");
        integrator.setCameraId(0);
        integrator.setBeepEnabled(false);
        integrator.setBarcodeImageEnabled(false);
        integrator.setOrientationLocked(false);
        integrator.initiateScan();
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {

        IntentResult result = IntentIntegrator.parseActivityResult(requestCode, resultCode, data);

        if (result != null){
            if(result.getContents() == null)
            {
                Toast.makeText(this, "You cancelled the scanning", Toast.LENGTH_LONG).show();
                onBackPressed();
            }
            else
            {
                Toast.makeText(this, result.getContents(), Toast.LENGTH_LONG).show();
                mWebView.loadUrl("http://192.168.1.6/goat/mobile/add-livestocks.php?data=" + result.getContents() );
            }
        }
        else
        {
            super.onActivityResult(requestCode, resultCode, data);
        }

    }


} //end mainactivity class


 class WebAppInterface {

    Context mContext;

    WebAppInterface(Context c) {
        mContext = c;
    }

    @JavascriptInterface
    public void runToast() {
        Toast.makeText(mContext, "test", Toast.LENGTH_LONG).show();
    }




    @JavascriptInterface
    public void openScanner() {

        ((MainActivity)mContext).runQrCodeScanner();
    }




}



