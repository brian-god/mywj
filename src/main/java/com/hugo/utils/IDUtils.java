package com.hugo.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * 各种id生成策略
 * <p>Title: IDUtils</p>
 * <p>Description: </p>
 */
public class IDUtils {
	/**
	 * 图片名生成
	 */
	public static String genImageName() {
		//取当前时间的长整形值包含毫秒
		long millis = System.currentTimeMillis();
		//long millis = System.nanoTime();
		//加上三位随机数
		Random random = new Random();
		int end3 = random.nextInt(999);
		//如果不足三位前面补0
		String str = millis + String.format("%03d", end3);

		return str;
	}

	/**
	 * 编号生成
	 */
	public static long genItemId() {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
		String millis = df.format(new Date());// new Date()为获取当前系统时间
		//加上两位随机数
		Random random = new Random();
		int end3 = random.nextInt(99);
		//如果不足三位前面补0
		String str = millis + String.format("%03d", end3);
		long id = Long.parseLong(str);
		return id;
	}

	public static void main(String[] args) {
		for(int i=0;i< 1000;i++)
			System.out.println(genItemId());
	}
}
