package com.util;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.awt.image.CropImageFilter;
import java.awt.image.FilteredImageSource;
import java.awt.image.ImageFilter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageInputStream;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/**
 * 图像裁剪以及压缩处理工具类
 * 
 * 提供基于JDK Image I/O 的解决方案(JDK探索失败)
 * 
 * 
 * @author
 * @since 1.0
 */
public class ImageUtil {

	// 输出打印日志
	public static boolean IS_DEBUG = true;

	/**
	 * 
	 * @param srcImg
	 *            原图片路径
	 * @param destImg
	 *            输出图片路径
	 * @param left
	 *            左边距
	 * @param top
	 *            上边距
	 * @param width
	 *            截剪宽度
	 * @param height
	 *            截剪高度
	 * @return
	 * @throws IOException
	 */
	public static boolean cutImage(String srcImg, String destImg, int left,
			int top, Integer width, Integer height) throws IOException {
		if (destImg == null || destImg.trim().length() == 0) {
			if (IS_DEBUG) {
				System.err.println("图片截剪：输出图片路径[" + destImg + "]错误。。。");
			}
			return false;
		}
		File file = new File(srcImg);
		if (file == null || file.exists() == false || file.isFile() == false) {
			if (IS_DEBUG) {
				System.err.println("图片截剪：[" + srcImg + "]文件不存在。。。");
			}
			return false;
		}
		return cutImage(javax.imageio.ImageIO.read(file), destImg, left, top,
				width, height);
	}

	/**
	 * 
	 * @param input
	 *            原图片输入流
	 * @param destImg
	 *            输出图片路径
	 * @param left
	 *            左边距
	 * @param top
	 *            上边距
	 * @param width
	 *            截剪宽度
	 * @param height
	 *            截剪高度
	 * @return
	 * @throws IOException
	 */
	public static boolean cutImage(InputStream input, String destImg, int left,
			int top, Integer width, Integer height) throws IOException {
		if (destImg == null || destImg.trim().length() == 0) {
			if (IS_DEBUG) {
				System.err.println("图片截剪：输出图片路径[" + destImg + "]错误。。。");
			}
			return false;
		}
		if (input == null) {
			if (IS_DEBUG) {
				System.err.println("图片截剪：输入流为空。。。");
			}
			return false;
		}
		return cutImage(javax.imageio.ImageIO.read(input), destImg, left, top,
				width, height);
	}

	/**
	 * 
	 * @param imginput
	 *            原图片输入流
	 * @param destImg
	 *            输出图片路径
	 * @param left
	 *            左边距
	 * @param top
	 *            上边距
	 * @param width
	 *            截剪宽度
	 * @param height
	 *            截剪高度
	 * @return
	 * @throws IOException
	 */
	public static boolean cutImage(ImageInputStream imginput, String destImg,
			int left, int top, Integer width, Integer height)
			throws IOException {
		if (destImg == null || destImg.trim().length() == 0) {
			if (IS_DEBUG) {
				System.err.println("图片截剪：输出图片路径[" + destImg + "]错误。。。");
			}
			return false;
		}
		if (imginput == null) {
			if (IS_DEBUG) {
				System.err.println("图片截剪：图片输入流为空。。。");
			}
			return false;
		}
		return cutImage(javax.imageio.ImageIO.read(imginput), destImg, left,
				top, width, height);
	}

	public static boolean cutImage(Image srcImage, String destImg, int left,
			int top, Integer width, Integer height) throws IOException {
		if (destImg == null || destImg.trim().length() == 0) {
			if (IS_DEBUG) {
				System.err.println("图片截剪：输出图片路径[" + destImg + "]错误。。。");
			}
			return false;
		}
		if (srcImage == null) {
			if (IS_DEBUG) {
				System.err.println("图片截剪：源图不是有效的图片。。。");
			}
			return false;
		}
		StringBuffer sb = null;
		boolean params_error = false;
		if (IS_DEBUG) {
			sb = new StringBuffer("图片截剪：");
		}
		int src_w = srcImage.getWidth(null); // 源图宽
		int src_h = srcImage.getHeight(null);// 源图高

		if (left < 0 || left >= src_w) {
			if (IS_DEBUG) {
				sb.append("左边距超出原图有效宽度！ ");
			}
			params_error = true;
		}
		if (top < 0 || top >= src_h) {
			if (IS_DEBUG) {
				sb.append("上边距超出原图有效高度！ ");
			}
			params_error = true;
		}
		if (width != null && width <= 0) {
			if (IS_DEBUG) {
				sb.append("截剪宽度不能小于或等于 0 ！ ");
			}
			params_error = true;
		}
		if (height != null && height <= 0) {
			if (IS_DEBUG) {
				sb.append("截剪高度不能小于或等于 0 ！ ");
			}
			params_error = true;
		}
		if (params_error) {
			if (IS_DEBUG) {
				System.err.println(sb.toString());
			}
			return false;
		}

		// 目标图片宽
		if (width == null || width > src_w || width + left > src_w) {
			width = src_w - left;
		}
		// 目标图片高
		if (height == null || height > src_h || height + top > src_h) {
			height = src_h - top;
		}
		// 目标图片
		ImageFilter cropFilter = new CropImageFilter(left, top, width,height);
		Image cutImage = Toolkit.getDefaultToolkit().createImage(
				new FilteredImageSource(srcImage.getSource(), cropFilter));
		// 重绘图片
		BufferedImage tag = new BufferedImage(width,height,
				BufferedImage.TYPE_INT_RGB);
		Graphics g = tag.getGraphics();
		g.drawImage(
				cutImage.getScaledInstance(width, height, Image.SCALE_SMOOTH),
				0, 0, null); // 绘制缩小后的图
		g.dispose();
		// 输出为文件
		FileOutputStream out = new FileOutputStream(destImg);
		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
		JPEGEncodeParam jep = JPEGCodec.getDefaultJPEGEncodeParam(tag);
		jep.setQuality((float) 1.0, true);
		encoder.encode(tag, jep);
		out.close();
		if (IS_DEBUG) {
			System.out.println("图片截剪：原图片宽高为[" + src_w + " ×　" + src_h
					+ "]，输出图片的宽高为[" + width + " ×　" + height + "].");
		}
		return true;
	}
	
	
	/** 
	    *  缩放后裁剪图片方法 
	    * @param srcImageFile 源文件 
	    * @param x  x坐标 
	    * @param y  y坐标 
	    * @param destWidth 最终生成的图片宽 
	    * @param destHeight 最终生成的图片高 
	    * @param finalWidth  缩放宽度 
	    * @param finalHeight  缩放高度 
	    */  
	   public static void abscut(String srcImageFile,String targetFile,int x, int y, int destWidth,  
	                             int destHeight,int finalWidth,int finalHeight) {  
	       try {  
	           Image img;  
	           ImageFilter cropFilter;  
	           // 读取源图像  
	           BufferedImage bi = ImageIO.read(new File(srcImageFile));  
	           int srcWidth = bi.getWidth(); // 源图宽度  
	           int srcHeight = bi.getHeight(); // 源图高度  
	  
	           if (srcWidth >= destWidth && srcHeight >= destHeight) {  
	               Image image = bi.getScaledInstance(finalWidth, finalHeight,Image.SCALE_DEFAULT);//获取缩放后的图片大小  
	               cropFilter = new CropImageFilter(x, y, destWidth, destHeight);  
	               img = Toolkit.getDefaultToolkit().createImage(  
	                       new FilteredImageSource(image.getSource(), cropFilter));  
	               BufferedImage tag = new BufferedImage(destWidth, destHeight,  
	                       BufferedImage.TYPE_INT_RGB);  
	               Graphics g = tag.getGraphics();  
	               g.drawImage(img, 0, 0, null); // 绘制截取后的图  
	               g.dispose();  
	               // 输出为文件  
	               ImageIO.write(tag, "JPEG", new File(targetFile));  
	           }  
	       } catch (Exception e) {  
	           e.printStackTrace();  
	       }  
	   }  

	/**
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {
		String bigSrc = "E:/tzprojects/tzupload/WebRoot/images/bg.jpg";
		String smallSrc = "E:/tzprojects/tzupload/WebRoot/images/small.jpg";
		ImageUtil.cutImage(bigSrc,smallSrc, 69,213,272,185);
	}
}
