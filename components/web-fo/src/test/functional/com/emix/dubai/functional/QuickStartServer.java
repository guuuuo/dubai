package com.emix.dubai.functional;

import org.eclipse.jetty.server.Connector;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.nio.SelectChannelConnector;
import org.eclipse.jetty.webapp.WebAppContext;
import org.springside.modules.test.jetty.JettyFactory;

/**
 * 使用Jetty运行调试Web应用, 在Console输入回车快速重新加载应用.
 *
 * @author calvin
 */
public class QuickStartServer {

    public static final int PORT = 8080;
    public static final String CONTEXT = "/";
    public static final String BASE_URL = "http://localhost:" + PORT;
    public static final String[] TLD_JAR_NAMES = new String[]{"sitemesh", "spring-webmvc", "shiro-web", "springside-core"};

    public static void main(String[] args) throws Exception {
        // 设定Spring的profile
        System.setProperty("spring.profiles.active", "development");

        Server server = new Server();

        Connector connector = new SelectChannelConnector();
        connector.setPort(PORT);
        server.setConnectors(new Connector[]{connector});

        WebAppContext context = new WebAppContext("components/web-cms/src/main/webapp", "/");
        server.setHandler(context);

        server.setStopAtShutdown(true);
        server.setSendServerVersion(true);

        JettyFactory.setTldJarNames(server, TLD_JAR_NAMES);

        try {
            server.start();

            System.out.println("Server running at " + BASE_URL);
            System.out.println("Hit Enter to reload the application");

            // 等待用户输入回车重载应用.
            while (true) {
                char c = (char) System.in.read();
                if (c == '\n') {
                    JettyFactory.reloadContext(server);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(-1);
        }
    }
}
