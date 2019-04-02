package com.fld.init.framework.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.function.BiConsumer;
import com.fld.framework.util.DateUtils;
import com.fld.framework.util.JacksonUtils;
import com.fld.framework.util.QRCodeUtil;
import com.fld.framework.util.URLCoderUtil;
import com.fld.framework.util.DateUtils.Age;

public class P {

	public static void main(String[] args) {
		course2Qrcode();

		// String fileName = "C:\\Users\\bangbangbangbang\\Desktop\\c.csv";
		// String outPutFileName = "C:\\Users\\bangbangbangbang\\Desktop\\d.csv";
		// // csv乱码,解决方案,打开文本文档设置编码ANSI另存为csv,然后使用excel打开正常
		// convertFileByLines(fileName, outPutFileName);
	}

	public static void readLine(String fileName, BiConsumer<String, String> action) {
		File file = new File(fileName);
		BufferedReader reader = null;
		BufferedWriter writer = null;
		try {
			reader = new BufferedReader(new FileReader(file));
			String tempString = null;
			int line = 1;
			// 一次读入一行，直到读入null为文件结束
			while ((tempString = reader.readLine()) != null) {
				// 输出
				action.accept(line + "", tempString);
				// 显示行号
				line++;
			}
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e1) {
				}
			}
			if (writer != null) {
				try {
					writer.close();
				} catch (IOException e1) {
				}
			}
		}

	}

	/**
	 * 课程生成二维码
	 */
	public static void course2Qrcode() {
		String fileName = "/Users/zhaokuner/Desktop/bbb";
		readLine(fileName, new BiConsumer<String, String>() {

			@Override
			public void accept(String t, String u) {
				String[] a = u.split("\\|");
				System.out.println(t + " " + a[0].trim() + " " + a[1].trim());
				String content = "http://c.sevenkids.cn/yzmm/account/course/jump/auth/" + a[1].trim() + "?serviceId=15&serviceType=3";
				System.out.println(content);
				Path path = Paths.get("/Users/zhaokuner/Desktop/qrcode/" + a[0].trim() + "." + QRCodeUtil.IMG_FORMAT);
				if (Files.notExists(path.getParent())) {
					try {
						Files.createDirectories(path.getParent());
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				System.out.println(path.toString());
				QRCodeUtil.encodeQrcode(content, path.toString());
			}

		});

	}

	/**
	 * 三千问导入小程序
	 */
	public static void sqw2xiaocxFileByLines(String fileName, String outPutFileName) {
		File file = new File(fileName);
		BufferedReader reader = null;
		BufferedWriter writer = null;
		try {
			reader = new BufferedReader(new FileReader(file));
			writer = new BufferedWriter(new FileWriter(outPutFileName));
			String tempString = null;
			int line = 1;
			ArrayList<HashMap<String, Object>> list = new ArrayList<>();
			// 一次读入一行，直到读入null为文件结束
			while ((tempString = reader.readLine()) != null) {
				line++;
				// 输出
				String[] arr = tempString.split(",");

				HashMap<String, Object> map = new HashMap<>();
				map.put("title", arr[0]);
				map.put("id", arr[1]);
				map.put("playUrl", "http://free.vod.aliyun.sevenkids.cn/sqw/" + arr[4]);
				String[] ar = arr[5].split("%3Cbr%3E");
				map.put("remark", ar);

				// 修改时间格式
				Age minAge = DateUtils.getAge(Integer.parseInt(arr[6]));
				String minYear = getAge(minAge);
				Age maxAge = DateUtils.getAge(Integer.parseInt(arr[7]));
				String maxYear = getAge(maxAge);
				Boolean ismax = maxYear.endsWith("月");
				// 避免最大年龄为月，如果是就进行替换
				if (ismax) {
				} else {
					String replace = maxYear.replace("月", "岁");
					maxYear = replace;
				}

				map.put("age", "推荐年龄" + minYear + "-" + maxYear);
				list.add(map);
			}
			writer.append(JacksonUtils.toJson(list));
			reader.close();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e1) {
				}
			}
			if (writer != null) {
				try {
					writer.close();
				} catch (IOException e1) {
				}
			}
		}
	}

	/**
	 * 
	 * @Title: getAge
	 * @Description: 计算年龄
	 * @author wangxu
	 * @param age
	 * @return
	 */
	public static String getAge(Age age) {
		String sage = "";
		if (age.year < 1 && age.month == 0) {
			sage += 0;
		}
		if (age.year < 1 && age.month > 0) {
			sage += (age.month + "").concat("月");
		}
		if (age.year >= 1 && age.month < 6) {
			sage += age.year + "岁";
		}
		if (age.year >= 1 && age.month >= 6) {
			sage += (age.year + "").concat(".5岁");
		}
		return sage;
	}

	/**
	 * 以行为单位读取文件，常用于读面向行的格式化文件 csv乱码,解决方案,打开文本文档设置编码ANSI另存为csv,然后使用excel打开正常
	 */
	public static void convertFileByLines(String fileName, String outPutFileName) {
		File file = new File(fileName);
		BufferedReader reader = null;
		BufferedWriter writer = null;
		try {
			System.out.println("以行为单位读取文件内容，一次读一整行：");
			reader = new BufferedReader(new FileReader(file));
			writer = new BufferedWriter(new FileWriter(outPutFileName));
			String tempString = null;
			int line = 1;
			// 一次读入一行，直到读入null为文件结束
			while ((tempString = reader.readLine()) != null) {
				// 显示行号
				System.out.println("line " + line + ": " + URLCoderUtil.decodeUTF8(tempString));
				line++;
				// 输出
				writer.append(URLCoderUtil.decodeUTF8(tempString));
				writer.newLine();
			}
			reader.close();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e1) {
				}
			}
			if (writer != null) {
				try {
					writer.close();
				} catch (IOException e1) {
				}
			}
		}
	}

}
