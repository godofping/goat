package com.example.test.farmer;

import android.Manifest;
import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Build;
import android.print.PrintAttributes;
import android.print.PrintDocumentAdapter;
import android.print.PrintJob;
import android.print.PrintManager;
import android.provider.Settings;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RequiresApi;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.webkit.JavascriptInterface;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.Toast;

import com.google.zxing.integration.android.IntentIntegrator;
import com.google.zxing.integration.android.IntentResult;

public class MainActivity extends AppCompatActivity {


    private  WebView mWebView;
    static ProgressDialog dialog;
    int test = 0;
    static String mylocation;

    private LocationManager locationManager;
    private LocationListener locationListener;
    Button button;
    Button button2;
    @RequiresApi(api = Build.VERSION_CODES.M)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        button= (Button) findViewById(R.id.button);
        button2= (Button) findViewById(R.id.button2);
        button.setVisibility(View.GONE);
        button2.setVisibility(View.GONE);
        mWebView = (WebView) findViewById(R.id.mainWebView);
        //for online
        mWebView.loadUrl("http://halalraisedgoats.tk/login.php");
        //for offline
//        mWebView.loadUrl("http://192.168.1.8/goat/mobile/customer.php");

        button.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                PrintManager printManager = (PrintManager) getSystemService(Context.PRINT_SERVICE);
                PrintDocumentAdapter printAdapter = mWebView.createPrintDocumentAdapter();
                String jobName = getString(R.string.app_name) + " Document";
                PrintAttributes.Builder builder = new PrintAttributes.Builder();
                builder.setMediaSize(PrintAttributes.MediaSize.ISO_A5);
                PrintJob printJob = printManager.print(jobName, printAdapter, builder.build());

                if(printJob.isCompleted()){
                    Toast.makeText(getApplicationContext(),"success", Toast.LENGTH_LONG).show();
                }
                else if(printJob.isFailed()){
                    Toast.makeText(getApplicationContext(), "failed", Toast.LENGTH_LONG).show();
                }
            }
        });

        button2.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                mWebView.goBack();
                button.setVisibility(View.GONE);
                button2.setVisibility(View.GONE);
            }
        });


        mWebView.setWebViewClient(new WebViewClient() {
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, String url) {

                if (url.contains("exit.php")) {
                    finish();
                    return true;
                }
                else if (url.contains("generatecodes.php")) {
                    button.setVisibility(View.VISIBLE);
                    button2.setVisibility(View.VISIBLE);
                    return false;
                }
                else{
                    button.setVisibility(View.GONE);
                    button2.setVisibility(View.GONE);
                    return false;
                }


            }




            // This method will be triggered when the Page Started Loading
            @Override
            public void onPageStarted(WebView view, String url, Bitmap favicon) {

                dialog = ProgressDialog.show(MainActivity.this, null,
                        "Loading");
//                dialog.setCancelable(true);
                super.onPageStarted(view, url, favicon);

            }

            // This method will be triggered when the Page loading is completed
            @Override
            public void onPageFinished(WebView view, String url) {
                dialog.dismiss();
                super.onPageFinished(view, url);

            }

            //this method is unnecessary
//            @Override
//            public void onLoadResource(WebView view, String url) {
//                dialog.dismiss();
//                super.onLoadResource(view, url);
//            }


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

        //para bumilis
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
            mWebView.setLayerType(View.LAYER_TYPE_HARDWARE, null);
        } else {
            mWebView.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
        }


        locationManager = (LocationManager) getSystemService(LOCATION_SERVICE);
        locationListener = new LocationListener() {
            @Override
            public void onLocationChanged(Location location) {
                mylocation = location.getLatitude() + "," + location.getLongitude();
                Log.d("the coordinates:", mylocation);

            }

            @Override
            public void onStatusChanged(String provider, int status, Bundle extras) {

            }

            @Override
            public void onProviderEnabled(String provider) {

            }

            @Override
            public void onProviderDisabled(String provider) {
                Intent intent = new Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS);
                startActivity(intent);
            }
        };

        if (Build.VERSION.SDK_INT < 23){
            locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 0, 0, locationListener);
        }
        else
        {
            if (ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
                // TODO: Consider calling
                //    ActivityCompat#requestPermissions
                // here to request the missing permissions, and then overriding
                //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
                //                                          int[] grantResults)
                // to handle the case where the user grants the permission. See the documentation
                // for ActivityCompat#requestPermissions for more details.

                ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.ACCESS_FINE_LOCATION}, 1);
                return;
            }else{
                locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 0, 0, locationListener);
            }
        }





    } //end oncreate

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);

        if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED ){
            if (ContextCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED){
                locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 0, 0, locationListener);
            }
        }
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

        if (mWebView.getUrl().contains("generatecodes.php")) {
        }
        else
        {
            button.setVisibility(View.GONE);
            button2.setVisibility(View.GONE);
        }




    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (event.getAction() == KeyEvent.ACTION_DOWN) {
            switch (keyCode) {
                case KeyEvent.KEYCODE_BACK:
                    if (mWebView.getUrl().contains("generatecodes.php")) {
                    }
                    else
                    {
                        button.setVisibility(View.GONE);
                        button2.setVisibility(View.GONE);
                        mWebView.goBack();
                    }
                    return true;
            }

        }
        return super.onKeyDown(keyCode, event);
    }

    final Activity activity = this;
    public void runQrCodeScanner(){
        IntentIntegrator integrator = new IntentIntegrator(activity);
        integrator.setDesiredBarcodeFormats(IntentIntegrator.QR_CODE_TYPES);
        integrator.setPrompt("Please scan the QR Code of the goat");
        integrator.setCameraId(0);
        integrator.setBeepEnabled(false);
        integrator.setBarcodeImageEnabled(false);
        integrator.setOrientationLocked(false);
        integrator.initiateScan();
    }



    @RequiresApi(api = Build.VERSION_CODES.KITKAT)
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
                Toast.makeText(this, "Successfully scanned", Toast.LENGTH_LONG).show();

                //for online
                mWebView.loadUrl("http://halalraisedgoats.tk/mobile/customer.php?data=" + result.getContents()+"&mylocation=" + mylocation );
                //for offline
//                mWebView.loadUrl("http://192.168.1.7/goat/mobile/customer.php?data=" + result.getContents()+"&mylocation=" + mylocation );
            }
        }
        else
        {
            super.onActivityResult(requestCode, resultCode, data);
        }





    }

    //--------------------------------------------------------------------








} //end mainactivity class






 class WebAppInterface {

    Context mContext;

    WebAppInterface(Context c) {
        mContext = c;
    }

    @RequiresApi(api = Build.VERSION_CODES.KITKAT)
    @JavascriptInterface
    public void runToast() {

        Toast.makeText(mContext,"test", Toast.LENGTH_LONG).show();
    }


    @JavascriptInterface
    public void openScanner() {

        ((MainActivity)mContext).runQrCodeScanner();
    }


}



