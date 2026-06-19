/// Toggle AI and camera features until backend / ML is wired.
///
/// Set [llmEnabled] when serverless OpenAI proxy is ready.
/// Set [cameraScanEnabled] when ML Kit camera pipeline is ready.
abstract final class AiFeatures {
  static const llmEnabled = false;
  static const cameraScanEnabled = false;
}
