package com.example.nashe_zoloto;

import android.app.Application;

import com.yandex.mapkit.MapKitFactory;

public class MainApplication extends Application {
  @Override
  public void onCreate() {
    super.onCreate();
    MapKitFactory.setLocale("ru_RU");
    MapKitFactory.setApiKey("6735131e-852c-40e2-8ee2-1baaf3024504");
  }
}
