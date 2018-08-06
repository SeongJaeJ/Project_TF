package model;

public class Coordinate {
	private Double daumCoordY;
	private Double daumCoordX;
	private Double lngY;
	private Double latX;
	private String address;
	public Double getDaumCoordY() {
		return daumCoordY;
	}
	public Double getDaumCoordX() {
		return daumCoordX;
	}
	public Double getLngY() {
		return lngY;
	}
	public Double getLatX() {
		return latX;
	}
	public String getAddress() {
		return address;
	}
	public void setDaumCoordY(Double daumCoordY) {
		this.daumCoordY = daumCoordY;
	}
	public void setDaumCoordX(Double daumCoordX) {
		this.daumCoordX = daumCoordX;
	}
	public void setLngY(Double lngY) {
		this.lngY = lngY;
	}
	public void setLatX(Double latX) {
		this.latX = latX;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "Coordinate [daumCoordY=" + daumCoordY + ", daumCoordX=" + daumCoordX + ", lngY=" + lngY + ", latX="
				+ latX + ", address=" + address + "]";
	}
}
