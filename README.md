# GPUImage-Examples
GPUImage3 Examples



## GPUImageTableViewController

- **BrightnessAdjustment**: Adjusts the brightness of the image. Described in detail <a href="http://redqueengraphics.com/2018/07/29/metal-shaders-color-adjustments/">here</a>.
  - *brightness*: The adjusted brightness (-1.0 - 1.0, with 0.0 as the default)

- **ExposureAdjustment**: Adjusts the exposure of the image. Described in detail <a href="http://redqueengraphics.com/2018/07/29/metal-shaders-color-adjustments/">here</a>.
  - *exposure*: The adjusted exposure (-10.0 - 10.0, with 0.0 as the default)

- **ContrastAdjustment**: Adjusts the contrast of the image. Described in detail <a href="http://redqueengraphics.com/2018/07/29/metal-shaders-color-adjustments/">here</a>.
  - *contrast*: The adjusted contrast (0.0 - 4.0, with 1.0 as the default)

- **SaturationAdjustment**: Adjusts the saturation of an image. Described in detail <a href="http://redqueengraphics.com/2018/07/29/metal-shaders-color-adjustments/">here</a>.
  - *saturation*: The degree of saturation or desaturation to apply to the image (0.0 - 2.0, with 1.0 as the default)

- **GammaAdjustment**: Adjusts the gamma of an image. Described in detail <a href="http://redqueengraphics.com/2018/07/29/metal-shaders-color-adjustments/">here</a>.
  - *gamma*: The gamma adjustment to apply (0.0 - 3.0, with 1.0 as the default)

- **LevelsAdjustment**: Photoshop-like levels adjustment. The minimum, middle, maximum, minOutput and maxOutput parameters are floats in the range [0, 1]. If you have parameters from Photoshop in the range [0, 255] you must first convert them to be [0, 1]. The gamma/mid parameter is a float >= 0. This matches the value from Photoshop. If you want to apply levels to RGB as well as individual channels you need to use this filter twice - first for the individual channels and then for all channels.

- **ColorMatrixFilter**: Transforms the colors of an image by applying a matrix to them
  - *colorMatrix*: A 4x4 matrix used to transform each color in an image
  - *intensity*: The degree to which the new transformed color replaces the original color for each pixel

- **RGBAdjustment**: Adjusts the individual RGB channels of an image. Described in detail <a href="http://redqueengraphics.com/2018/07/29/metal-shaders-color-adjustments/">here</a>.
  - *red*: Normalized values by which each color channel is multiplied. The range is from 0.0 up, with 1.0 as the default.
  - *green*: 
  - *blue*:

- **WhiteBalance**: Adjusts the white balance of an image.
  - *temperature*: The temperature to adjust the image by, in ºK. A value of 4000 is very cool and 7000 very warm. The default value is 5000. Note that the scale between 4000 and 5000 is nearly as visually significant as that between 5000 and 7000.
  - *tint*: The tint to adjust the image by. A value of -200 is *very* green and 200 is *very* pink. The default value is 0.  

- **HighlightsAndShadows**: Adjusts the shadows and highlights of an image
  - *shadows*: Increase to lighten shadows, from 0.0 to 1.0, with 0.0 as the default.
  - *highlights*: Decrease to darken highlights, from 1.0 to 0.0, with 1.0 as the default.

- **HueAdjustment**: Adjusts the hue of an image
  - *hue*: The hue angle, in degrees. 90 degrees by default

- **ColorInversion**: Inverts the colors of an image. Described in detail <a href="http://redqueengraphics.com/2018/07/15/metal-shaders-color-inversion/">here</a>.

- **Luminance**: Reduces an image to just its luminance (greyscale). Described in detail <a href="http://redqueengraphics.com/2018/07/26/metal-shaders-luminance/">here</a>.

- **MonochromeFilter**: Converts the image to a single-color version, based on the luminance of each pixel
  - *intensity*: The degree to which the specific color replaces the normal image color (0.0 - 1.0, with 1.0 as the default)
  - *color*: The color to use as the basis for the effect, with (0.6, 0.45, 0.3, 1.0) as the default.

- **Haze**: Used to add or remove haze (similar to a UV filter)
  - *distance*: Strength of the color applied. Default 0. Values between -.3 and .3 are best.
  - *slope*: Amount of color change. Default 0. Values between -.3 and .3 are best.

- **SepiaToneFilter**: Simple sepia tone filter
  - *intensity*: The degree to which the sepia tone replaces the normal image color (0.0 - 1.0, with 1.0 as the default)

- **OpacityAdjustment**: Adjusts the alpha channel of the incoming image
  - *opacity*: The value to multiply the incoming alpha channel for each pixel by (0.0 - 1.0, with 1.0 as the default)

- **LuminanceThreshold**: Pixels with a luminance above the threshold will appear white, and those below will be black
  - *threshold*: The luminance threshold, from 0.0 to 1.0, with a default of 0.5

- **Vibrance**: Adjusts the vibrance of an image
  - *vibrance*: The vibrance adjustment to apply, using 0.0 as the default, and a suggested min/max of around -1.2 and 1.2, respectively.

- **HighlightAndShadowTint**: Allows you to tint the shadows and highlights of an image independently using a color and intensity
  - *shadowTintColor*: Shadow tint RGB color (GPUVector4). Default: `{1.0f, 0.0f, 0.0f, 1.0f}` (red).
  - *highlightTintColor*: Highlight tint RGB color (GPUVector4). Default: `{0.0f, 0.0f, 1.0f, 1.0f}` (blue).
  - *shadowTintIntensity*: Shadow tint intensity, from 0.0 to 1.0. Default: 0.0
  - *highlightTintIntensity*: Highlight tint intensity, from 0.0 to 1.0, with 0.0 as the default.

### Blending modes ###

  - **DissolveBlend**: Applies a dissolve blend of two images
    - *mix*: The degree with which the second image overrides the first (0.0 - 1.0, with 0.5 as the default)

  - **MultiplyBlend**: Applies a multiply blend of two images

  - **AddBlend**: Applies an additive blend of two images

  - **SubtractBlend**: Applies a subtractive blend of two images

  - **DivideBlend**: Applies a division blend of two images

  - **OverlayBlend**: Applies an overlay blend of two images

  - **DarkenBlend**: Blends two images by taking the minimum value of each color component between the images

  - **LightenBlend**: Blends two images by taking the maximum value of each color component between the images

  - **ColorBurnBlend**: Applies a color burn blend of two images

  - **ColorDodgeBlend**: Applies a color dodge blend of two images

  - **ScreenBlend**: Applies a screen blend of two images

  - **ExclusionBlend**: Applies an exclusion blend of two images

  - **DifferenceBlend**: Applies a difference blend of two images

  - **HardLightBlend**: Applies a hard light blend of two images

  - **SoftLightBlend**: Applies a soft light blend of two images

  - **AlphaBlend**: Blends the second image over the first, based on the second's alpha channel
    - *mix*: The degree with which the second image overrides the first (0.0 - 1.0, with 1.0 as the default)

  - **SourceOverBlend**: Applies a source over blend of two images

  - **ColorBurnBlend**: Applies a color burn blend of two images

  - **ColorDodgeBlend**: Applies a color dodge blend of two images

  - **NormalBlend**: Applies a normal blend of two images

  - **ColorBlend**: Applies a color blend of two images

  - **HueBlend**: Applies a hue blend of two images

  - **SaturationBlend**: Applies a saturation blend of two images

  - **LuminosityBlend**: Applies a luminosity blend of two images

  - **LinearBurnBlend**: Applies a linear burn blend of two images


## CameraOperationController

Camera Operations

## ImageOperationController

Image Operations

## VideoOperationController

Video Operations