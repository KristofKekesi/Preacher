String optimizedImages(options, height, width) {
  /**
      Firstly calculating if a picture is smaller or bigger than the canvas,
      than calculating the numbers of pixels on the picture. Uses it to calculate
      the biggestSmaller and the SmallestBigger.
   **/
  double max = double.infinity;
  double min = 0;
  int finalist;

  for (var index = 0; index < options.length; index++) {
    // KNOWN SIZES
    if (width != false && height != false) {
      // PERFECT SIZE
      if (options[index]["height"] == height &&
          options[index]["width"] == width) {
        return options[index]["dir"];
      }
      // BIGGER THAN CANVAS
      else if (options[index]["height"] > height &&
          options[index]["width"] > width &&
          max >= options[index]["width"] * options[index]["height"]) {
        finalist = index;
        max = options[index]["width"] * options[index]["height"] + .0;
      }
      if (finalist == null) {
        // SMALLER THAN CANVAS (IF THERE IS NO BIGGER)
        if ((options[index]["height"] < height ||
                options[index]["width"] < width) &&
            min <= options[index]["width"] * options[index]["height"]) {
          finalist = index;
          min = options[index]["width"] * options[index]["height"] + .0;
        }
      }
    }

    // UNKNOWN WIDTH
    if (width == false && height != false) {
      // PERFECT SIZE
      if (options[index]["height"] == height) {
        return options[index]["dir"];
      }
      // BIGGER THAN CANVAS
      else if (options[index]["height"] > height &&
          max >= options[index]["height"]) {
        finalist = index;
        max = options[index]["height"] + .0;
      }
      if (finalist == null) {
        // SMALLER THAN CANVAS (IF THERE IS NO BIGGER)
        if (options[index]["height"] < height &&
            min <= options[index]["height"]) {
          finalist = index;
          min = options[index]["height"] + .0;
        }
      }
    }

    // UNKNOWN HEIGHT
    if (width != false && height == false) {
      // PERFECT SIZE
      if (options[index]["width"] == width) {
        return options[index]["dir"];
      }
      // BIGGER THAN CANVAS
      else if (options[index]["width"] > width &&
          max >= options[index]["width"]) {
        finalist = index;
        max = options[index]["width"] + .0;
      }
      if (finalist == null) {
        // SMALLER THAN CANVAS (IF THERE IS NO BIGGER)
        if (options[index]["width"] < width && min <= options[index]["width"]) {
          finalist = index;
          min = options[index]["width"] + .0;
        }
      }
    }
  }

  return options[finalist]["dir"];
}
