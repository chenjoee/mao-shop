package io.github.chenjoee.pms.service.impl;

import io.github.chenjoee.pms.entity.Brand;
import io.github.chenjoee.pms.mapper.BrandMapper;
import io.github.chenjoee.pms.service.IBrandService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 品牌 服务实现类
 * </p>
 *
 * @author jobob
 * @since 2020-06-27
 */
@Service
public class BrandServiceImpl extends ServiceImpl<BrandMapper, Brand> implements IBrandService {

}
