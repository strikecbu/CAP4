package com.iisigroup.cap.base.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.iisigroup.cap.base.dao.CodeItemDao;
import com.iisigroup.cap.base.dao.RoleDao;
import com.iisigroup.cap.base.model.CodeItem;
import com.iisigroup.cap.base.model.RoleFunction;
import com.iisigroup.cap.base.service.PgmSetService;
import com.iisigroup.cap.dao.utils.ISearch;
import com.iisigroup.cap.jdbc.CapNamedJdbcTemplate;
import com.iisigroup.cap.model.Page;
import com.iisigroup.cap.security.CapSecurityContext;
import com.iisigroup.cap.service.AbstractService;
import com.iisigroup.cap.utils.CapDate;
import com.iisigroup.cap.utils.CapString;

/**
 * <pre>
 * 系統功能維護
 * </pre>
 * 
 * @since 2014/1/16
 * @author tammy
 * @version <ul>
 *          <li>2014/1/16,tammy,new
 *          </ul>
 */
@Service("pgmSetService")
public class PgmSetServiceImpl extends AbstractService implements PgmSetService {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(PgmSetServiceImpl.class);

	@Resource
	private CodeItemDao codeItemDao;

	@Resource
	private RoleDao roleDao;

	private CapNamedJdbcTemplate jdbc;

	public void setJdbc(CapNamedJdbcTemplate jdbc) {
		this.jdbc = jdbc;
	}

	@Override
	public CodeItem find(String code) {
		if (!CapString.isEmpty(code)) {
			return codeItemDao.find(Integer.parseInt(code));
		}
		return null;
	}

	@Override
	public List<CodeItem> findBySystypAndStep(String systyp, String step) {
		return codeItemDao.findBySystypAndStep(systyp, step);
	}

	@Override
	public void savePgm(CodeItem model, List<String> setRole) {
		for (RoleFunction rlf : model.getRlfList()) {
			if (!setRole.contains(rlf.getRolCode())) {
				roleDao.delete(rlf);
			} else {
				setRole.remove(rlf.getRolCode());
			}
		}
		List<RoleFunction> rlfList = new ArrayList<RoleFunction>();
		for (String role : setRole) {
			RoleFunction rlf = new RoleFunction();
			rlf.setRolCode(role);
			rlf.setPgmCode(Integer.toString(model.getCode()));
			rlf.setUpdater(CapSecurityContext.getUserId());
			rlf.setUpdTime(CapDate.getCurrentTimestamp());
			rlfList.add(rlf);
		}
		model.setRlfList(rlfList);

		codeItemDao.save(model);
	}

	@Override
	public Page<Map<String, Object>> findPage(ISearch search, String systyp,
			String pgmCode) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("systyp", systyp);
		param.put("pgmCode", pgmCode);

		return jdbc.queryForPage("pgmSet_role", param, search.getFirstResult(),
				search.getMaxResults());
	}
}
