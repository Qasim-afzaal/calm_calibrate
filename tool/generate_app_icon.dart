// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:ui' as ui;

import 'package:calm_calibrate/core/branding/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

/// Renders splash logo PNGs for iOS + Android launcher icons.
///
/// Outputs:
/// - assets/branding/app_icon.png — full orange tile (1024², square for iOS mask)
/// - assets/branding/app_icon_foreground.png — white icon on transparent (Android)
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _loadMaterialIcons();

  const canvas = 1024.0;
  // Larger than splash (44/80) so the glyph stays legible on the home screen.
  const iconSize = canvas * 0.62;

  final iosKey = GlobalKey();
  final androidKey = GlobalKey();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColoredBox(
        color: Colors.transparent,
        child: OverflowBox(
          maxWidth: canvas * 2 + 32,
          maxHeight: canvas,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RepaintBoundary(
                key: iosKey,
                child: AppLogo(
                  size: canvas,
                  iconSize: iconSize,
                  borderRadius: 0,
                ),
              ),
              const SizedBox(width: 32),
              RepaintBoundary(
                key: androidKey,
                child: AppLogo(
                  size: canvas,
                  iconSize: iconSize,
                  iconOnly: true,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  await _waitForRender();

  final outDir = Directory('assets/branding');
  await outDir.create(recursive: true);

  await _capturePng(iosKey, File('${outDir.path}/app_icon.png'));
  await _capturePng(androidKey, File('${outDir.path}/app_icon_foreground.png'));

  print('Done. Run: dart run flutter_launcher_icons');
  exit(0);
}

Future<void> _loadMaterialIcons() async {
  final loader = FontLoader('MaterialIcons');
  loader.addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf'));
  await loader.load();
}

Future<void> _waitForRender() async {
  for (var i = 0; i < 12; i++) {
    await WidgetsBinding.instance.endOfFrame;
    await Future<void>.delayed(const Duration(milliseconds: 50));
  }
}

Future<void> _capturePng(GlobalKey key, File out) async {
  final context = key.currentContext;
  if (context == null) {
    stderr.writeln('Failed to render ${out.path}.');
    exit(1);
  }

  final boundary = context.findRenderObject()! as RenderRepaintBoundary;
  final image = await boundary.toImage(pixelRatio: 1);
  final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
  if (bytes == null) {
    stderr.writeln('Failed to encode ${out.path}.');
    exit(1);
  }

  await out.writeAsBytes(bytes.buffer.asUint8List());
  print('Wrote ${out.path} (${out.lengthSync()} bytes)');
}
