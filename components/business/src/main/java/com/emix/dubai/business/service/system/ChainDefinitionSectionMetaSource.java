package com.emix.dubai.business.service.system;

import com.emix.dubai.business.entity.system.Resource;
import com.emix.dubai.business.repository.system.ResourceRepository;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.config.Ini;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.annotation.Autowired;

import java.text.MessageFormat;
import java.util.Iterator;

/**
 * @author nikog
 */
public class ChainDefinitionSectionMetaSource implements FactoryBean<Ini.Section> {

    @Autowired
    private ResourceRepository resourceRepository;

    private String filterChainDefinitions;

    /**
     * 默认premission字符串
     */
    public static final String PERMISSION_STRING = "perms[\"{0}\"]";


    public Ini.Section getObject() throws BeansException {

        //获取所有Resource
        Iterable<Resource> list = resourceRepository.findAll();

        Ini ini = new Ini();
        //加载默认的url
        ini.load(filterChainDefinitions);
        Ini.Section section = ini.getSection(Ini.DEFAULT_SECTION_NAME);
        //循环Resource的url,逐个添加到section中。section就是filterChainDefinitionMap,
        //里面的键就是链接URL,值就是存在什么条件才能访问该链接
        for (Iterator<Resource> it = list.iterator(); it.hasNext(); ) {

            Resource resource = it.next();
            //如果不为空值添加到section中
            if (StringUtils.isNotEmpty(resource.getResource()) && StringUtils.isNotEmpty(resource.getPermission())) {
                section.put(resource.getResource(), MessageFormat.format(PERMISSION_STRING, resource.getPermission()));
            }

        }

        return section;
    }

    /**
     * 通过filterChainDefinitions对默认的url过滤定义
     *
     * @param filterChainDefinitions 默认的url过滤定义
     */
    public void setFilterChainDefinitions(String filterChainDefinitions) {
        this.filterChainDefinitions = filterChainDefinitions;
    }


    public Class<?> getObjectType() {
        return this.getClass();
    }


    public boolean isSingleton() {
        return false;
    }

}
