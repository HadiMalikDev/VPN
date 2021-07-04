package com.example.openvpnapppractice

import io.flutter.embedding.android.FlutterActivity
import com.topfreelancerdeveloper.flutter_openvpn.FlutterOpenvpnPlugin
import android.content.Intent
class MainActivity: FlutterActivity() {

    override fun onActivityResult(requestCode:Int,resultCode:Int,data:Intent?){
        if (requestCode == 1) {
            if (resultCode == RESULT_OK) {
                FlutterOpenvpnPlugin.setPermission(true);
            } else {
                FlutterOpenvpnPlugin.setPermission(false);
            }
        }
    }
}
