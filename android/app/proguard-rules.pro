# CalmCalibrate — R8 / ProGuard rules for Flutter release builds.
# https://developer.android.com/studio/build/shrink-code

# ── Flutter embedding ──────────────────────────────────────────────────────────
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.embedding.** { *; }
-dontwarn io.flutter.embedding.**

# Generated plugin registrant
-keep class io.flutter.plugins.GeneratedPluginRegistrant { *; }

# JNI / native methods used by the engine
-keepclasseswithmembernames class * {
    native <methods>;
}

# ── Kotlin / coroutines (used by plugins) ────────────────────────────────────
-dontwarn kotlin.**
-dontwarn kotlinx.**
-keep class kotlin.Metadata { *; }
-keepclassmembers class kotlin.Metadata {
    public <methods>;
}

# ── Java 8+ desugaring ───────────────────────────────────────────────────────
-dontwarn java.lang.invoke.StringConcatFactory
-dontwarn j$.util.**

# ── flutter_local_notifications ──────────────────────────────────────────────
-keep class com.dexterous.** { *; }
-dontwarn com.dexterous.**

# ── AndroidX / Material (transitive plugin deps) ─────────────────────────────
-dontwarn androidx.**
-keep class androidx.lifecycle.** { *; }

# ── SQLite / Drift native libs ─────────────────────────────────────────────────
-keep class org.sqlite.** { *; }
-dontwarn org.sqlite.**
-keep class com.tekartik.sqflite.** { *; }
-dontwarn com.tekartik.sqflite.**

# ── Gson / JSON reflection (safe if any plugin uses it) ────────────────────────
-keepattributes Signature
-keepattributes *Annotation*
-keepattributes EnclosingMethod
-keepattributes InnerClasses
-dontwarn com.google.gson.**
-keep class com.google.gson.** { *; }
-keep class * extends com.google.gson.TypeAdapter
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

# ── Play Services (optional; ignore if not on classpath) ─────────────────────
-dontwarn com.google.android.gms.**

# ── General noise suppression ──────────────────────────────────────────────────
-dontwarn javax.annotation.**
-dontwarn org.conscrypt.**
-dontwarn org.bouncycastle.**
-dontwarn org.openjsse.**

# Keep line numbers for readable crash reports in Play Console
-keepattributes SourceFile,LineNumberTable
-renamesourcefileattribute SourceFile
