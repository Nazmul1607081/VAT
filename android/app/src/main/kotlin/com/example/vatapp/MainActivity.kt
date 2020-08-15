package com.example.vatapp


import android.app.AlertDialog
import android.app.Dialog
import android.content.DialogInterface
import android.content.Intent
import android.net.Uri
import android.os.Handler
import android.provider.Settings
import android.view.KeyEvent

import androidx.annotation.NonNull
import com.google.android.vending.licensing.*
import io.flutter.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


private const val BASE64_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxrgQbcLhR394DQkjssqLtPCyZed4kghwFONHfXQmat03cMVduHQ/MfOqiCSc7IiwQAobQRQ7AH+VOiJGLjJgXnCbQn/hGgU6B3a+WBX3Mv8m84GDcGOzOZeRcuGRDVw3CE+d46cfwDu8EqOn7vFzIbKIj7w2Tz2EOjCM8u+u/q97Nd4buWemdgm3hBdjx7dWfQ/3KdfPLoyuKe6mQ6xXWlHZCuRp9qEWf4P+GP1iQ8lnK2e6TNTu9fyFCpFEjr5at2CY5aX9MHqh5RqQMIT6Fkg0HmdRvKfOUb9aJwH4fwEsFjiXo7NiltlS7KuRMKDOQvQAkzpgFQ1WFaTk/or7BQIDAQAB"


private val SALT = byteArrayOf(
        -46, 45, 31, -128, -101, -57, 74, -64, 51, 88,
        -91, -45, 77, -117, -31, -113, -11, 32, -64, 89
)




class MainActivity: FlutterActivity() {
    private val CHANNEL = "samples.flutter.dev/battery"
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            // Note: this method is invoked on the main thread.
            call, result ->
            if (call.method == "getBatteryLevel") {
                val batteryLevel = getBatteryLevel()

                if (batteryLevel != -1) {
                    result.success(batteryLevel)
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }
    private var mLicenseCheckerCallback: LicenseCheckerCallback? = null
    private var mChecker: LicenseChecker? = null
    private var keepGoing = true
    private lateinit var handler: Handler
    

    private fun getBatteryLevel(): Int {



        val deviceId : String = Settings.Secure.ANDROID_ID

        mLicenseCheckerCallback = MyLicenseCheckerCallback()
        mChecker = LicenseChecker(this, ServerManagedPolicy(this,
                AESObfuscator(SALT, packageName, deviceId)),
                BASE64_PUBLIC_KEY)
        handler = Handler()
        doCheck()

        return 123
    }

    private fun doCheck() {
        mChecker!!.checkAccess(mLicenseCheckerCallback)
    }
    private inner class MyLicenseCheckerCallback : LicenseCheckerCallback {
        @Suppress("DEPRECATION")
        override fun applicationError(errorCode: Int) {
            if (isFinishing) {
                return;
            }
            keepGoing = false;
            showDialog(0);
        }

        @Suppress("DEPRECATION")
        override fun dontAllow(reason: Int) {
            if (isFinishing) {
                // Don't update UI if Activity is finishing.
                return
            }
            
            keepGoing = false;
            
           /// displayResult(getString(R.string.dont_allow))
            showDialog(0);

        }

        override fun allow(reason: Int) {
            if (isFinishing) {
                // Don't update UI if Activity is finishing.
                return;
            }
        }

    }

    override fun onResume() {
        super.onResume()
        if (!keepGoing) {
            finish()
        }
    }
    override fun onDestroy() {
        super.onDestroy()
        mChecker?.onDestroy()

    }

    override fun onCreateDialog(id: Int): Dialog? {
        // We have only one dialog.
        return AlertDialog.Builder(this)
                .setTitle("VAT GUIDE")
                .setMessage("This application is not licensed, please buy it from the play store.")
                .setPositiveButton("Buy") { dialog, which ->
                    val marketIntent = Intent(Intent.ACTION_VIEW, Uri.parse(
                            "http://market.android.com/details?id=$packageName"))
                    startActivity(marketIntent)
                    finish()
                }
                .setNegativeButton("Exit") { dialog, which -> finish() }
                .setNeutralButton("Re-Check") { dialog, which -> doCheck() }
                .setCancelable(false)
                .setOnKeyListener { dialogInterface, i, keyEvent ->
                    Log.i("License", "Key Listener")
                    finish()
                    true
                }
                .create()
    }

}


