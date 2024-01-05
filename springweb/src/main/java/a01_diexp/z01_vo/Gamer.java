package a01_diexp.z01_vo;

import java.util.Properties;
import java.util.Set;

public class Gamer {
	// 구슬의 종류 할당
	private Set<String> beadKinds;
	// 구슬의 종류와 가진 갯수
	private Properties beadsCnts;
	
	public Set<String> getBeadKinds() {
		return beadKinds;
	}
	public void setBeadKinds(Set<String> beadKinds) {
		this.beadKinds = beadKinds;
	}
	public Properties getBeadsCnts() {
		return beadsCnts;
	}
	public void setBeadsCnts(Properties beadsCnts) {
		this.beadsCnts = beadsCnts;
	}

}
