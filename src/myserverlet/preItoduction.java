package myserverlet;

import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by ministrong on 2018/7/25.
 */
public class preItoduction {

    /**
     * 去除html代码中含有的标签
     *
     * @param htmlStr
     * @return
     */
    public static String delHtmlTags(String htmlStr) {
        //定义script的正则表达式，去除js可以防止注入
        String scriptRegex = "<script[^>]*?>[\\s\\S]*?<\\/script>";
        //定义style的正则表达式，去除style样式，防止css代码过多时只截取到css样式代码
        String styleRegex = "<style[^>]*?>[\\s\\S]*?<\\/style>";
        //定义HTML标签的正则表达式，去除标签，只提取文字内容
        String htmlRegex = "<[^>]+>";
        //定义空格,回车,换行符,制表符
        String spaceRegex = "\\s*|\t|\r|\n";

        // 过滤script标签
        htmlStr = htmlStr.replaceAll(scriptRegex, "");
        // 过滤style标签
        htmlStr = htmlStr.replaceAll(styleRegex, "");
        // 过滤html标签
        htmlStr = htmlStr.replaceAll(htmlRegex, "");
        // 过滤空格等
        htmlStr = htmlStr.replaceAll(spaceRegex, "");
        return htmlStr.trim(); // 返回文本字符串
    }

    /**
     * 获取HTML代码里的内容
     *
     * @param htmlStr
     * @return
     */
    public String getTextFromHtml(String htmlStr) {
        //去除html标签
        htmlStr = delHtmlTags(htmlStr);
        //去除空格" "
        htmlStr = htmlStr.replaceAll(" ", "");
        return htmlStr;
    }


    public Set<String> getImgStr(String htmlStr) {
        Set<String> pics =new HashSet<>();
        String img = "";
        Pattern p_image;
        Matcher m_image;
        String regEx_img = "de*src\\s*=\\s*(.*?)[^>]*?>";
        p_image = Pattern.compile(regEx_img, Pattern.CASE_INSENSITIVE);
        m_image = p_image.matcher(htmlStr);
        while (m_image.find()) {
            // 得到<img />数据
            img = m_image.group();
            // 匹配<img>中的src数据
            Matcher m = Pattern.compile("src\\s*=\\s*\"?(.*?)(\"|>|\\s+)").matcher(img);
            while (m.find()) {
                pics.add(m.group(1));
            }
        }
        return pics;


    }
}
