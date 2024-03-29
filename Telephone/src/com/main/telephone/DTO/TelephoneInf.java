package com.main.telephone.DTO;

// Generated 21-Sep-2013 13:28:02 by Hibernate Tools 3.4.0.CR1

/**
 * TelephoneInf generated by hbm2java
 */
public class TelephoneInf implements java.io.Serializable {

	private int boothId;
	private Double lat;
	private Double lng;
	private Character status;

	public TelephoneInf() {
	}

	public TelephoneInf(int boothId) {
		this.boothId = boothId;
	}

	public TelephoneInf(int boothId, Double lat, Double lng, Character status) {
		this.boothId = boothId;
		this.lat = lat;
		this.lng = lng;
		this.status = status;
	}

	public int getBoothId() {
		return this.boothId;
	}

	public void setBoothId(int boothId) {
		this.boothId = boothId;
	}

	public Double getLat() {
		return this.lat;
	}

	public void setLat(Double lat) {
		this.lat = lat;
	}

	public Double getLng() {
		return this.lng;
	}

	public void setLng(Double lng) {
		this.lng = lng;
	}

	public Character getStatus() {
		return this.status;
	}

	public void setStatus(Character status) {
		this.status = status;
	}

}
