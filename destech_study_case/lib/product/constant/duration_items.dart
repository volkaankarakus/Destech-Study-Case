class DurationItems extends Duration{
  DurationItems.durationSmall() : super(microseconds: 500);
  DurationItems.durationNormal() : super(seconds: 1);
  DurationItems.durationHigh() : super(seconds: 2);
  DurationItems.durationXHigh() : super(seconds: 5);
}