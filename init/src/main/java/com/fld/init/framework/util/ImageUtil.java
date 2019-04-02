package com.fld.init.framework.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.FontFormatException;
import java.awt.Graphics2D;
import java.awt.GraphicsEnvironment;
import java.awt.Rectangle;
import java.awt.RenderingHints;
import java.awt.color.ColorSpace;
import java.awt.geom.AffineTransform;
import java.awt.geom.Ellipse2D;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.awt.image.ColorConvertOp;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.TreeMap;
import javax.imageio.ImageIO;

/**
 * EasyImage lets you do all the basic image operations - converting, cropping, resizing, rotating,
 * flipping… Plus it let’s you do some really cool affects. All is done super easily. Combining
 * operations can produce some very cool results.
 * 
 * Operations: Open image. Save image Convert image Re-size image Crop image Convert to black and
 * white image Rotate image Flip image Add color to image Create image with multiple instance of the
 * original Combining 2 images together Emphasize parts of the image Affine transform image
 *
 * 
 * @author Avi Yehuda
 *
 */
public class ImageUtil {
  private BufferedImage bufferedImage;
  private String fileName;

  public ImageUtil(int width, int height) {
    this(width, height, Color.WHITE);
  }

  public ImageUtil(int width, int height, Color bg) {
    bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
    Graphics2D gg = bufferedImage.createGraphics();
    gg.setBackground(bg);
    gg.clearRect(0, 0, width, height);
    gg.dispose();
  }

  /**
   * Constructor - loads from an image file.
   * 
   * @param imageFile
   */
  public ImageUtil(File imageFile) {
    try {
      bufferedImage = ImageIO.read(imageFile);
      fileName = imageFile.getAbsolutePath();
    } catch (Exception e) {
      e.printStackTrace();
      bufferedImage = null;
      imageFile = null;
    }
  }

  /**
   * Constructor - loads from an image file.
   * 
   * @param imageFilePath
   */
  public ImageUtil(String imageFilePath) {
    this(new File(imageFilePath));
  }

  /**
   * Return image as java.awt.image.BufferedImage
   * 
   * @return image as java.awt.image.BufferedImage
   */
  public BufferedImage getAsBufferedImage() {
    return bufferedImage;
  }

  /**
   * Save the image as a new image file. Can also convert the image according to file type.
   * 
   * @param fileName
   */
  public void saveAs(String fileName) {
    saveImage(new File(fileName));
    this.fileName = fileName;
  }

  /**
   * Saves the image to the original file.
   */
  public void save() {
    saveImage(new File(fileName));
  }

  /**
   * Resizing the image by percentage of the original.
   * 
   * @param percentOfOriginal
   */
  public void resize(int percentOfOriginal) {
    int newWidth = bufferedImage.getWidth() * percentOfOriginal / 100;
    int newHeight = bufferedImage.getHeight() * percentOfOriginal / 100;
    resize(newWidth, newHeight);
  }

  /**
   * Resizing the image by width and height.
   * 
   * @param newWidth
   * @param newHeight
   */
  public void resize(int newWidth, int newHeight) {

    int oldWidth = bufferedImage.getWidth();
    int oldHeight = bufferedImage.getHeight();

    if (newWidth == -1 || newHeight == -1) {
      if (newWidth == -1) {
        if (newHeight == -1) {
          return;
        }

        newWidth = newHeight * oldWidth / oldHeight;
      } else {
        newHeight = newWidth * oldHeight / oldWidth;
      }
    }

    BufferedImage result = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_BGR);

    double widthSkip = new Double(oldWidth - newWidth) / new Double(newWidth);
    double heightSkip = new Double(oldHeight - newHeight) / new Double(newHeight);

    double widthCounter = 0;
    double heightCounter = 0;

    int newY = 0;

    boolean isNewImageWidthSmaller = widthSkip > 0;
    boolean isNewImageHeightSmaller = heightSkip > 0;

    for (int y = 0; y < oldHeight && newY < newHeight; y++) {

      if (isNewImageHeightSmaller && heightCounter > 1) { // new image
                                                          // suppose to be
                                                          // smaller -
                                                          // skip row
        heightCounter -= 1;
      } else if (heightCounter < -1) { // new image suppose to be bigger -
                                       // duplicate row
        heightCounter += 1;

        if (y > 1)
          y = y - 2;
        else
          y = y - 1;
      } else {

        heightCounter += heightSkip;

        int newX = 0;

        for (int x = 0; x < oldWidth && newX < newWidth; x++) {

          if (isNewImageWidthSmaller && widthCounter > 1) { // new
                                                            // image
                                                            // suppose
                                                            // to be
                                                            // smaller
                                                            // -
                                                            // skip
                                                            // column
            widthCounter -= 1;
          } else if (widthCounter < -1) { // new image suppose to be
                                          // bigger - duplicate pixel
            widthCounter += 1;

            if (x > 1)
              x = x - 2;
            else
              x = x - 1;
          } else {

            int rgb = bufferedImage.getRGB(x, y);
            result.setRGB(newX, newY, rgb);

            newX++;

            widthCounter += widthSkip;
          }

        }

        newY++;
      }

    }

    bufferedImage = result;
  }

  /**
   * Add color to the RGB of the pixel
   * 
   * @param numToAdd
   */
  public void addPixelColor(int numToAdd) {
    int width = bufferedImage.getWidth();
    int height = bufferedImage.getHeight();

    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        int rgb = bufferedImage.getRGB(x, y);
        bufferedImage.setRGB(x, y, rgb + numToAdd);
      }
    }
  }

  /**
   * Covert image to black and white.
   */
  public void convertToBlackAndWhite() {
    ColorSpace gray_space = ColorSpace.getInstance(ColorSpace.CS_GRAY);
    ColorConvertOp convert_to_gray_op = new ColorConvertOp(gray_space, null);
    convert_to_gray_op.filter(bufferedImage, bufferedImage);
  }

  /**
   * Rotates image 90 degrees to the left.
   */
  public void rotateLeft() {

    int width = bufferedImage.getWidth();
    int height = bufferedImage.getHeight();

    BufferedImage result = new BufferedImage(height, width, BufferedImage.TYPE_INT_BGR);

    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        int rgb = bufferedImage.getRGB(x, y);
        result.setRGB(y, x, rgb);
      }
    }

    bufferedImage = result;

  }

  /**
   * Rotates image 90 degrees to the right.
   */
  public void rotateRight() {
    int width = bufferedImage.getWidth();
    int height = bufferedImage.getHeight();

    BufferedImage result = new BufferedImage(height, width, BufferedImage.TYPE_INT_BGR);

    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        int rgb = bufferedImage.getRGB(x, y);
        result.setRGB(height - y - 1, x, rgb);
      }
    }

    bufferedImage = result;

  }

  /**
   * Rotates image 180 degrees.
   */
  public void rotate180() {
    int width = bufferedImage.getWidth();
    int height = bufferedImage.getHeight();

    BufferedImage result = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);

    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        int rgb = bufferedImage.getRGB(x, y);
        result.setRGB(width - x - 1, height - y - 1, rgb);
      }
    }

    bufferedImage = result;

  }

  /**
   * Flips the image horizontally
   */
  public void flipHorizontally() {
    int width = bufferedImage.getWidth();
    int height = bufferedImage.getHeight();

    BufferedImage result = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);

    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        int rgb = bufferedImage.getRGB(x, y);
        result.setRGB(width - x - 1, y, rgb);
      }
    }

    bufferedImage = result;

  }

  /**
   * Flips the image vertically.
   */
  public void flipVertically() {
    int width = bufferedImage.getWidth();
    int height = bufferedImage.getHeight();

    BufferedImage result = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);

    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        int rgb = bufferedImage.getRGB(x, y);
        result.setRGB(x, height - y - 1, rgb);
      }
    }

    bufferedImage = result;

  }

  /**
   * Multiply the image.
   * 
   * @param timesToMultiplyVertically
   * @param timesToMultiplyHorizantelly
   */
  public void multiply(int timesToMultiplyVertically, int timesToMultiplyHorizantelly) {
    multiply(timesToMultiplyVertically, timesToMultiplyHorizantelly, 0);
  }

  /**
   * Multiply the image and also add color each of the multiplied images.
   * 
   * @param timesToMultiplyVertically
   * @param timesToMultiplyHorizantelly
   */
  public void multiply(int timesToMultiplyVertically, int timesToMultiplyHorizantelly,
      int colorToHenhancePerPixel) {
    int width = bufferedImage.getWidth();
    int height = bufferedImage.getHeight();

    BufferedImage result = new BufferedImage(width * timesToMultiplyVertically,
        height * timesToMultiplyHorizantelly, BufferedImage.TYPE_INT_BGR);

    for (int xx = 0; xx < timesToMultiplyVertically; xx++) {
      for (int yy = 0; yy < timesToMultiplyHorizantelly; yy++) {
        for (int x = 0; x < width; x++) {
          for (int y = 0; y < height; y++) {
            int rgb = bufferedImage.getRGB(x, y);
            result.setRGB(width * xx + x, height * yy + y,
                rgb + colorToHenhancePerPixel * (yy + xx));

          }
        }
      }
    }

    bufferedImage = result;
  }

  /**
   * Combines the image with another image in an equal presence to both;
   * 
   * @param newImagePath - image to combine with
   */
  public void combineWithPicture(String newImagePath) {
    combineWithPicture(newImagePath, 2);
  }

  /**
   * Combines the image with another image. jump = 2 means that every two pixels the new image is
   * replaced. This makes the 2 images equal in presence. If jump=3 than every 3rd pixel is replaced
   * by the new image. As the jump is higher this is how much the new image has less presence.
   * 
   * @param newImagePath
   * @param jump
   */
  public void combineWithPicture(String newImagePath, int jump) {
    try {
      BufferedImage bufferedImage2 = ImageIO.read(new File(newImagePath));
      combineWithPicture(bufferedImage2, jump, null, 0, 0);
    } catch (Exception e) {
      e.printStackTrace();
      throw new RuntimeException(e);
    }
  }

  public void combineWithPicture(ImageUtil image2, Integer xx, Integer yy) {
    combineWithPicture(image2.getAsBufferedImage(), 1, null, xx, yy);
  }

  public void combineWithPicture(ImageUtil image2) {
    combineWithPicture(image2.getAsBufferedImage(), 1, null, 0, 0);
  }

  public void combineWithPicture(ImageUtil image2, int jump) {
    combineWithPicture(image2.getAsBufferedImage(), jump, null, 0, 0);
  }

  public void combineWithPicture(ImageUtil image2, Color ignoreColor) {
    combineWithPicture(image2.getAsBufferedImage(), 2, ignoreColor, 0, 0);
  }

  public void combineWithPicture(ImageUtil image2, int jump, Color ignoreColor) {
    combineWithPicture(image2.getAsBufferedImage(), jump, ignoreColor, 0, 0);
  }

  /**
   * Combines the image with another image. jump = 2 means that every two pixels the new image is
   * replaced. This makes the 2 images equal in presence. If jump=3 than every 3rd pixel is replaced
   * by the new image. As the jump is higher this is how much the new image has less presence.
   * 
   * ignoreColor is a color in the new image that will not be copied - this is good where there is a
   * background which you do not want to copy.
   * 
   * @param bufferedImage2
   * @param jump
   * @param ignoreColor
   */
  private void combineWithPicture(BufferedImage bufferedImage2, int jump, Color ignoreColor,
      Integer xx, Integer yy) {
    checkJump(jump);

    xx = xx == null ? 0 : xx;
    yy = yy == null ? 0 : yy;

    int width = bufferedImage.getWidth();
    int height = bufferedImage.getHeight();

    int width2 = bufferedImage2.getWidth();
    int height2 = bufferedImage2.getHeight();

    int ignoreColorRgb = -1;

    if (ignoreColor != null) {
      ignoreColorRgb = ignoreColor.getRGB();
    }

    for (int y = 0; y < height; y++) {
      for (int x = y % jump; x < width; x += jump) {

        if (x < xx || y < yy) {
          continue;
        }

        if (x >= width2 + xx || y >= height2 + yy) {
          continue;
        }

        int rgb = bufferedImage2.getRGB(x - xx, y - yy);

        if (rgb != ignoreColorRgb) {
          bufferedImage.setRGB(x, y, rgb);
        }
      }
    }

  }

  public void crop(int startX, int startY, int endX, int endY) {
    int width = bufferedImage.getWidth();
    int height = bufferedImage.getHeight();

    if (startX == -1) {
      startX = 0;
    }

    if (startY == -1) {
      startY = 0;
    }

    if (endX == -1) {
      endX = width - 1;
    }

    if (endY == -1) {
      endY = height - 1;
    }

    BufferedImage result =
        new BufferedImage(endX - startX + 1, endY - startY + 1, BufferedImage.TYPE_INT_BGR);

    for (int y = startY; y < endY; y++) {
      for (int x = startX; x < endX; x++) {
        int rgb = bufferedImage.getRGB(x, y);
        result.setRGB(x - startX, y - startY, rgb);
      }
    }
    bufferedImage = result;
  }

  private void saveImage(File file) {
    try {
      ImageIO.write(bufferedImage, getFileType(file), file);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public void emphasize(int startX, int startY, int endX, int endY) {
    emphasize(startX, startY, endX, endY, Color.BLACK, 3);
  }

  public void emphasize(int startX, int startY, int endX, int endY, Color backgroundColor) {
    emphasize(startX, startY, endX, endY, backgroundColor, 3);
  }

  public void emphasize(int startX, int startY, int endX, int endY, int jump) {
    emphasize(startX, startY, endX, endY, Color.BLACK, jump);
  }

  public void emphasize(int startX, int startY, int endX, int endY, Color backgroundColor,
      int jump) {

    checkJump(jump);

    int width = bufferedImage.getWidth();
    int height = bufferedImage.getHeight();

    if (startX == -1) {
      startX = 0;
    }

    if (startY == -1) {
      startY = 0;
    }

    if (endX == -1) {
      endX = width - 1;
    }

    if (endY == -1) {
      endY = height - 1;
    }

    for (int y = 0; y < height; y++) {
      for (int x = y % jump; x < width; x += jump) {

        if (y >= startY && y <= endY && x >= startX && x <= endX) {
          continue;
        }

        bufferedImage.setRGB(x, y, backgroundColor.getRGB());
      }
    }

  }

  private void checkJump(int jump) {
    if (jump < 1) {
      throw new RuntimeException("Error: jump can not be less than 1");
    }

  }

  public void addColorToImage(Color color, int jump) {
    addColorToImage(color.getRGB(), jump);
  }

  public void addColorToImage(int rgb, int jump) {
    checkJump(jump);

    int width = bufferedImage.getWidth();
    int height = bufferedImage.getHeight();

    for (int y = 0; y < height; y++) {
      for (int x = y % jump; x < width; x += jump) {
        bufferedImage.setRGB(x, y, rgb);
      }
    }
  }

  public void affineTransform(double fShxFactor, double fShyFactor) {

    try {
      AffineTransform shearer = AffineTransform.getShearInstance(fShxFactor, fShyFactor);
      AffineTransformOp shear_op = new AffineTransformOp(shearer, null);
      bufferedImage = shear_op.filter(bufferedImage, null);
    } catch (Exception e) {
      System.out.println("Shearing exception = " + e);
    }
  }

  private String getFileType(File file) {
    String fileName = file.getName();
    int idx = fileName.lastIndexOf(".");
    if (idx == -1) {
      throw new RuntimeException("Invalid file name");
    }

    return fileName.substring(idx + 1);
  }

  public int getWidth() {
    return bufferedImage.getWidth();
  }

  public int getHeight() {
    return bufferedImage.getHeight();
  }

  public void addString(String text, Color color, Font f, Integer x, Integer y) {
    Graphics2D g = bufferedImage.createGraphics();
    g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
    g.setColor(color);
    g.setFont(f);
    g.drawString(text, x, y + f.getSize());
    g.dispose();
  }

  public void addString(String text, Font f, Integer x, Integer y) {
    addString(text, Color.BLACK, f, x, y);
  }

  public void addString(String text, Integer x, Integer y) {
    Font f = new Font("宋体", Font.BOLD, 20);
    addString(text, f, x, y);
  }

  public void ellipse() {
    Ellipse2D.Double shape =
        new Ellipse2D.Double(0, 0, bufferedImage.getWidth(), bufferedImage.getHeight());
    BufferedImage bi2 = new BufferedImage(bufferedImage.getWidth(), bufferedImage.getHeight(),
        BufferedImage.TYPE_INT_RGB);
    Graphics2D g2 = bi2.createGraphics();
    {
      // 增加下面代码使得背景透明
      // bi2 = g2.getDeviceConfiguration().createCompatibleImage(bufferedImage.getWidth(),
      // bufferedImage.getHeight(), Transparency.TRANSLUCENT);
      // g2.dispose();
      // g2 = bi2.createGraphics();
    }
    g2.fill(new Rectangle(bi2.getWidth(), bi2.getHeight()));
    g2.setClip(shape);
    g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
    g2.drawImage(bufferedImage, 0, 0, null);
    g2.dispose();
    bufferedImage = bi2;
  }

  public File pngToJpg(File f) {
    if (null == f) {
      return f;
    }
    try {
      String path = f.getAbsolutePath();
      if (path.toLowerCase().endsWith(".png")) {
        BufferedImage src = ImageIO.read(f);
        File ff = new File(path.substring(0, path.length() - 3) + "jpg");
        ImageIO.write(src, "jpg", ff);
        return ff;
      }
    } catch (IOException e) {
    }
    return f;
  }

  public static void main(String[] args) throws IOException, FontFormatException {
    ImageUtil image = new ImageUtil(750, 1334);
    ImageUtil bbb = new ImageUtil("/data/bbb.png");
    image.combineWithPicture(bbb);
    File headImg = null;
    // File headImg = NetFileUtils.downloadFile(
    // "http://onlinefile.sevenkids.cn/uploadc/201706/18/1497783210592NJvC.jpg", "/data/");
    if (null == headImg) {
      // headImg = new File("/Users/zhaokuner/Documents/workspace/yzmm-parent/yzmm/src/main/webapp"
      // + Configuration.RES_LOGO);
    }
    ImageUtil fico = new ImageUtil(headImg);
    // int h = fico.getHeight();
    // int w = fico.getWidth();
    // fico.resize(w >= h ? 100 : -1, w < h ? 100 : -1);
    fico.resize(100, 100);
    fico.ellipse();
    image.combineWithPicture(fico, 330, 200);

    // image.combineWithPicture(new ImageUtil("/data/dd.jpg"), 0, 1000);
    image.addString("~(｡≧з≦)ﾉ⌒☆星星☆", Color.WHITE, new Font("宋体", Font.PLAIN, 40), 30, 120);
    // Font f = Font.createFont(0, new File("/Users/zhaokuner/Downloads/汉仪旗黑/HYQiHeiY4-35W.otf"));
    // f = f.deriveFont(Font.PLAIN, 40);
    // image.addString("~(｡≧з≦)ﾉ⌒☆星星☆", Color.WHITE, f, 30, 120);
    // image.addString("105", Color.WHITE, new Font("宋体", Font.PLAIN, 40), 30, 120);
    // image.translucent();
    File qRCode = new File("/data/qRCode.jpg");
    // QRCodeUtil.encodeQrcode(
    // "http://onlinefile.sevenkids.cn/uploadc/201706/18/1497783210592NJvC.jpg", qRCode, 200, 200);
    image.combineWithPicture(new ImageUtil(qRCode), 280, 1000);

    image.saveAs("/data/bb.png");
  }

  /**
   * 获取系统字体对应全路径Map
   * 
   * @return Map
   */
  public static Map<String, String> getFontPathMap() {
    TreeMap<String, String> fontPathMap = new TreeMap<String, String>();
    GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
    Font[] fonts = ge.getAllFonts();
    if (fonts == null || fonts.length < 1) {
      return fontPathMap;
    }
    for (Font font : fonts) {
      System.out.println(font.getFontName());
    }
    return fontPathMap.descendingMap(); // 倒序
  }

}
