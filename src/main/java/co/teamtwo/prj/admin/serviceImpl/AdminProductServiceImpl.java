package co.teamtwo.prj.admin.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.teamtwo.prj.admin.service.AdminProductMapper;
import co.teamtwo.prj.admin.service.AdminProductService;
import co.teamtwo.prj.admin.service.AdminProductVO;

@Service
@Primary
public class AdminProductServiceImpl implements AdminProductService {
	@Autowired
	private AdminProductMapper map;
	
	@Override
	public List<AdminProductVO> AdminProductSelectList() {
		// TODO Auto-generated method stub
		return map.AdminProductSelectList();
	}

	@Override
	public AdminProductVO AdminProductSelect(AdminProductVO vo) {
		// TODO Auto-generated method stub
		return map.AdminProductSelect(vo);
	}

	@Override
	public int AdminProductInsert(AdminProductVO vo) {
		// TODO Auto-generated method stub
		return map.AdminProductInsert(vo);
	}

	@Override
	public int AdminProductUpdate(AdminProductVO vo) {
		// TODO Auto-generated method stub
		return map.AdminProductUpdate(vo);
	}

	@Override
	public int AdminProductDelete(AdminProductVO vo) {
		// TODO Auto-generated method stub
		return map.AdminProductDelete(vo);
	}

}
