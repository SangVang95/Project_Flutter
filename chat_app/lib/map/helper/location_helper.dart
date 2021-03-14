const GOOGLE_API_KEY = 'AIzaSyDf4HiE2W5Gwf99b-fl_W7ptXHeuXBbKKU';

class LocationHelper {
  static String generateLocation(double lat, double long) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$long&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$lat,$long&key=$GOOGLE_API_KEY';
  }
}
