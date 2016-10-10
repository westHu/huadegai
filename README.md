请按照下面的规则修改demo中的内容

1.修改demo-api,demo-business,demo-dubbo,demo-web的名字为自己项目所需要的名字

2.同步修改外层pom的artifactId为自己项目名，以及modules改为子项目的名字

3.error.properties请写在api项目中

4.如果需要单独发布dubbo服务的项目，请注意以下配置也要同步修改

    a.datasource.properties修改为自己项目的数据库链接，数据库连接池初始化大小，请根据项目访问情况酌情分配。
    b.dubbo.properties请按照自己的项目，将变量的名字修改成更合理的名字。group和version等也请根据真实项目进行修改

5.demo-web项目中也做和第4步同样的配置修改

=========================================================

关于log4j的配置说明：
    目前线上和预发环境的log4j的配置已经做了响应的精简，本地和开发环境的调试可以适当的降低日志级别，新项目线上和预发环境可以参看下面的log4j配置:

    说明: 目前flume已经采用监听文件的方式，日志级别统一为info到error。
         第一部分的配置为业务日志相关的配置。
         第二部分配置为系统日志相关的配置。
         第三部分为需要添加到业务日志的文件路径，目前较多的为net.xkeshi,com.xkeshi,自己项目中，有比较特殊的，自行添加

    <?xml version="1.0" encoding="UTF-8" ?>
    <!DOCTYPE log4j:configuration SYSTEM "log4j.dtd">

    <log4j:configuration xmlns:log4j="http://jakarta.apache.org/log4j/">

        <appender name="file-business" class="org.apache.log4j.DailyRollingFileAppender">
            <param name="File" value="/home/www/logs/openapi/openapi-busi.log"/>
            <param name="Append" value="true"/>
            <layout class="org.apache.log4j.PatternLayout">
                <param name="ConversionPattern" value="[%d{yyyy-MM-dd HH:mm:ss}][%-5p]%F:%L - %m%n"/>
            </layout>
            <filter class="org.apache.log4j.varia.LevelRangeFilter">
                <param name="LevelMin" value="info"/>
                <param name="LevelMax" value="error"/>
            </filter>
        </appender>

        <appender name="file-sys" class="org.apache.log4j.DailyRollingFileAppender">
            <param name="File" value="/home/www/logs/openapi/openapi-sys.log"/>
            <param name="Append" value="true"/>
            <layout class="org.apache.log4j.PatternLayout">
                <param name="ConversionPattern" value="[%d{yyyy-MM-dd HH:mm:ss}][%-5p]%F:%L - %m%n"/>
            </layout>
            <filter class="org.apache.log4j.varia.LevelRangeFilter">
                <param name="LevelMin" value="info"/>
                <param name="LevelMax" value="error"/>
            </filter>
        </appender>

        <logger name="net.xkeshi" additivity="false">
            <level value="info"/>
            <appender-ref ref="file-business"/>
        </logger>

        <logger name="com.xkeshi" additivity="false">
            <level value="info"/>
            <appender-ref ref="file-business"/>
        </logger>

        <root>
            <priority value="info"/>
            <appender-ref ref="file-sys"/>
        </root>

    </log4j:configuration>