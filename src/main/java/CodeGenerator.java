import cn.org.rapid_framework.generator.GeneratorFacade;

/**
 * @auther: mm
 * @Date: 2018/7/19 11:55
 * @Description:
 */
public class CodeGenerator {
    public static void main(String[] args) throws Exception {
        // 模板地址
        String templatePath = "E:\\happy\\src\\main\\resources\\template";
        GeneratorFacade g = new GeneratorFacade();
        System.out.println("1111111111111");
        g.getGenerator().addTemplateRootDir(templatePath);
        // 删除生成器的输出目录//
        //g.deleteOutRootDir();
        // 通过数据库表生成文件
        g.generateByAllTable();


    }
}
