package co.teamtwo.prj.admin.service;

import java.util.List;

public interface AdminProductService {
	List<AdminProductVO> AdminProductSelectList();
	AdminProductVO AdminProductSelect(AdminProductVO vo);
	int AdminProductInsert(AdminProductVO vo);
	int AdminProductUpdate(AdminProductVO vo);
	int AdminProductDelete(AdminProductVO vo);
}
