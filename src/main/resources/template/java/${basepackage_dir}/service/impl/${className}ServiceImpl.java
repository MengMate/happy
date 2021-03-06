<#include "/java_copyright.include">
<#assign className = table.className>
<#assign classNameLower = className?uncap_first>
package ${basepackage}.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

<#include "/java_imports.include">

/**
<#include "/java_description.include">
 */
@Service
@Transactional
@SuppressWarnings({"serial", "SpellCheckingInspection"})
public class ${className}ServiceImpl implements ${className}Service{

	private ${className}Dao ${classNameLower}Dao;
	/**增加setXXXX()方法,spring就可以通过autowire自动设置对象属性,请注意大小写*/
	public void set${className}Dao(${className}Dao dao) {
		this.${classNameLower}Dao = dao;
	}

	/**
	 * 创建${className}
	 **/
	public ${className} save(${className} ${classNameLower}) {
	    Assert.notNull(${classNameLower},"'${classNameLower}' must be not null");
	    initDefaultValuesForCreate(${classNameLower});
	    new ${className}Checker().checkCreate${className}(${classNameLower});
	    this.${classNameLower}Dao.save(${classNameLower});
	    return ${classNameLower};
	}

	/**
	 * 更新${className}
	 **/
    public ${className} update(${className} ${classNameLower}) {
        Assert.notNull(${classNameLower},"'${classNameLower}' must be not null");
        new ${className}Checker().checkUpdate${className}(${classNameLower});
        this.${classNameLower}Dao.update(${classNameLower});
        return ${classNameLower};
    }

	/**
	 * 删除${className}
	 **/
    public void removeById(${table.idColumn.javaType} id) {
        this.${classNameLower}Dao.deleteById(id);
    }

	/**
	 * 根据ID得到${className}
	 **/
    public ${className} getById(${table.idColumn.javaType} id) {
        return this.${classNameLower}Dao.getById(id);
    }

	/**
	 * 分页查询: ${className}
	 **/
	@Transactional(readOnly=true)
	public Page findPage(${className}Query query) {
	    Assert.notNull(query,"'query' must be not null");
		return ${classNameLower}Dao.findPage(query);
	}

<#list table.columns as column>
	<#if column.unique && !column.pk>
	@Transactional(readOnly=true)
	public ${className} getBy${column.columnName}(${column.javaType} v) {
		return ${classNameLower}Dao.getBy${column.columnName}(v);
	}

	</#if>
</#list>

	/**
	 * 为创建时初始化相关默认值
	 **/
    public void initDefaultValuesForCreate(${className} v) {
    }

/**
<#include "/java_description.include">
 */
@Service
@Transactional
public class ${className}Checker {
        /**可以在此检查只有更新才需要的特殊检查 */
        public void checkUpdate${className}(${className} v) {
            check${className}(v);
        }

        /**可以在此检查只有创建才需要的特殊检查 */
        public void checkCreate${className}(${className} v) {
            check${className}(v);
        }

        /** 检查到有错误请直接抛异常，不要使用 return errorCode的方式 */
        public void check${className}(${className} v) {
        	// Bean Validator检查,属性检查失败将抛异常
        	validateWithException(v);

        	//复杂的属性的检查一般需要分开写几个方法，如 checkProperty1(v),checkProperty2(v)
        }
    }
}
