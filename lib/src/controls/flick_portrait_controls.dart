import 'package:flutter/material.dart';
import 'package:flick_video_player_custom/flick_video_player_custom.dart';

/// Default portrait controls.
class FlickPortraitControls extends StatelessWidget {
  const FlickPortraitControls({Key? key, this.iconSize = 20, this.fontSize = 12, this.progressBarSettings}) : super(key: key);

  /// Icon size.
  ///
  /// This size is used for all the player icons.
  final double iconSize;

  /// Font size.
  ///
  /// This size is used for all the text.
  final double fontSize;

  /// [FlickProgressBarSettings] settings.
  final FlickProgressBarSettings? progressBarSettings;

  @override
  Widget build(BuildContext context) {
    return FlickShowControlsAction(
      child: FlickAutoHideChild(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: FlickShowControlsAction(
                child: FlickSeekVideoAction(
                  child: Center(
                    child: FlickVideoBuffer(
                      child: FlickAutoHideChild(
                        isTransparent: true,
                        showIfVideoNotInitialized: false,
                        child: FlickPlayToggle(
                          size: 30,
                          color: Colors.black,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlickVideoProgressBar(
                      flickProgressBarSettings: progressBarSettings,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlickPlayToggle(
                          size: iconSize,
                        ),
                        SizedBox(
                          width: iconSize / 2,
                        ),
                        FlickSoundToggle(
                          size: iconSize,
                        ),
                        SizedBox(
                          width: iconSize / 2,
                        ),
                        Row(
                          children: <Widget>[
                            FlickCurrentPosition(
                              fontSize: fontSize,
                            ),
                            Text(
                              ' / ',
                              style: TextStyle(color: Colors.white, fontSize: fontSize),
                            ),
                            FlickTotalDuration(
                              fontSize: fontSize,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        FlickSubtitleToggle(
                          size: iconSize,
                        ),
                        SizedBox(
                          width: iconSize / 2,
                        ),
                        FlickFullScreenToggle(
                          size: iconSize,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 16,
              top: 10,
              child: const FlickBtnSetting(),
            ),
          ],
        ),
      ),
    );
  }
}
