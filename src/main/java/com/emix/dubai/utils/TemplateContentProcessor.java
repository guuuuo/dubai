package com.emix.dubai.utils;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import org.apache.log4j.Logger;

import java.io.StringReader;
import java.io.StringWriter;

public class TemplateContentProcessor {
    private static Logger log = Logger.getLogger(TemplateContentProcessor.class);
    private static Configuration configuration;

    static {
        configuration = new Configuration();
        configuration.setClassForTemplateLoading(TemplateContentProcessor.class, "/template");
        configuration.setObjectWrapper(new DefaultObjectWrapper());
        configuration.setTagSyntax(Configuration.AUTO_DETECT_TAG_SYNTAX);
        configuration.setDefaultEncoding("UTF-8");
        configuration.setWhitespaceStripping(true);
    }

    @SuppressWarnings("unchecked")
    public static String processTemplate(String content, Object parameter) {
        try {
            StringReader reader = new StringReader(content);
            Template template = new Template("string template", reader, configuration);
            StringWriter writer = new StringWriter();
            template.process(parameter, writer);
            return writer.toString();
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw new TemplateContentProcessorException(e);
        }
    }

    public static String processTemplateWithFile(String fileName, Object root) {
        try {
            Template template = configuration.getTemplate(fileName);
            StringWriter writer = new StringWriter();
            template.process(root, writer);
            return writer.toString();
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            throw new TemplateContentProcessorException(e);
        }
    }

    private static final class TemplateContentProcessorException extends RuntimeException {
        private TemplateContentProcessorException(Throwable cause) {
            super(cause);
        }
    }
}
