import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localmaterialnotes/common/actions/labels/select.dart';
import 'package:localmaterialnotes/models/label/label.dart';
import 'package:localmaterialnotes/providers/labels/labels/labels_provider.dart';

/// Toggles the pined status of the [label].
///
/// Returns `true` if the pined status of the [label] was toggled, `false` otherwise.
Future<bool> togglePinLabel(BuildContext context, WidgetRef ref, Label? label) async {
  if (label == null) {
    return false;
  }

  await ref.read(labelsProvider.notifier).togglePin(label);

  return false;
}

/// Toggles the pined status of the [labels].
Future<void> togglePinLabels(WidgetRef ref, List<Label> labels) async {
  await ref.read(labelsProvider.notifier).togglePinAll(labels);

  exitLabelsSelectionMode(ref);
}