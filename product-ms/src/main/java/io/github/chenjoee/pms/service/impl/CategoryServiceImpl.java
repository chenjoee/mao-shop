package io.github.chenjoee.pms.service.impl;

import io.github.chenjoee.pms.entity.Category;
import io.github.chenjoee.pms.mapper.CategoryMapper;
import io.github.chenjoee.pms.service.ICategoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 商品分类 服务实现类
 * </p>
 *
 * @author jobob
 * @since 2020-06-27
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements ICategoryService {

}
