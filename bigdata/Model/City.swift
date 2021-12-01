//
//  City.swift
//  bigdata
//
//  Created by Александр Пономарёв on 13.11.2021.
//

import Foundation

// MARK: - City
struct City: Codable {
	let us, ca, af, al: Ad?
	let dz, cityAS, ad, ao: Ad?
	let ai: Ad?
	let aq: Aq?
	let ag: Ag?
	let ar, am, aw, au: Ad?
	let at, az, bs, bh: Ad?
	let bd, bb, by, be: Ad?
	let bz, bj, bm, bt: Ad?
	let bo, ba, bw, bv: Ad?
	let br, io, vg, bn: Ad?
	let bg, bf, bi, kh: Ad?
	let cm, cv, ky, cf: Ad?
	let td, cl, cn, cx: Ad?
	let cc, co, km, cg: Ad?
	let ck: Aq?
	let cr, ci, hr, cu: Ad?
	let cy, cz, dk, dj: Ad?
	let dm, cityDO, tp, ec: Ad?
	let eg, sv, gq, er: Ad?
	let ee, et, fk, fo: Ad?
	let fj, fi, fr: Ad?
	let fx: Aq?
	let gf, pf, tf, ga: Ad?
	let gm, ge, de, gh: Ad?
	let gi, gr, gl, gd: Ad?
	let gp, gu, gt, gn: Ad?
	let gw, gy, ht: Ad?
	let hm: Aq?
	let hn, hk, hu, cityIS: Ad?
	let cityIN, id, iq, ie: Ad?
	let ir, il, it, jm: Ad?
	let jp, jo, kz, ke: Ad?
	let ki, kr, kw, kg: Ad?
	let la, lv, lb, ls: Ad?
	let lr, ly, li, lt: Ad?
	let lu, mo, mg, mw: Ad?
	let my, mv, ml, mt: Ad?
	let mh, mq, mr, mu: Ad?
	let yt, mx, fm: Ad?
	let md: Md?
	let mc, mn, ms, ma: Ad?
	let mz, mm, na, nr: Ad?
	let np, nl, an, nc: Ad?
	let nz, ni, ne, ng: Ad?
	let nu, nf, mp, no: Ad?
	let om, pk, pw, pa: Ad?
	let pg, py, pe, ph: Ad?
	let pn, pl, pt, pr: Ad?
	let qa, re, ro, ru: Ad?
	let rw, lc, ws, sm: Ad?
	let st, sa, sn, sc: Ad?
	let sl, sg, sk, si: Ad?
	let sb, so, za, es: Ad?
	let lk, sh, kn, pm: Ad?
	let vc, sd, sr: Ad?
	let sj: Aq?
	let sz, se, ch, sy: Ad?
	let tw, tj: Ad?
	let tz: Tz?
	let th, tg, tk, to: Ad?
	let tt, tn, tr, tm: Ad?
	let tc: Aq?
	let tv, ug, ua, ae: Ad?
	let gb, um, vi, uy: Ad?
	let uz, vu: Ad?
	let va: Aq?
	let ve, vn, wf, eh: Ad?
	let ye: Ad?
	let yu: Aq?
	let zr, zm, zw: Ad?

	enum CodingKeys: String, CodingKey {
		case us = "US"
		case ca = "CA"
		case af = "AF"
		case al = "AL"
		case dz = "DZ"
		case cityAS = "AS"
		case ad = "AD"
		case ao = "AO"
		case ai = "AI"
		case aq = "AQ"
		case ag = "AG"
		case ar = "AR"
		case am = "AM"
		case aw = "AW"
		case au = "AU"
		case at = "AT"
		case az = "AZ"
		case bs = "BS"
		case bh = "BH"
		case bd = "BD"
		case bb = "BB"
		case by = "BY"
		case be = "BE"
		case bz = "BZ"
		case bj = "BJ"
		case bm = "BM"
		case bt = "BT"
		case bo = "BO"
		case ba = "BA"
		case bw = "BW"
		case bv = "BV"
		case br = "BR"
		case io = "IO"
		case vg = "VG"
		case bn = "BN"
		case bg = "BG"
		case bf = "BF"
		case bi = "BI"
		case kh = "KH"
		case cm = "CM"
		case cv = "CV"
		case ky = "KY"
		case cf = "CF"
		case td = "TD"
		case cl = "CL"
		case cn = "CN"
		case cx = "CX"
		case cc = "CC"
		case co = "CO"
		case km = "KM"
		case cg = "CG"
		case ck = "CK"
		case cr = "CR"
		case ci = "CI"
		case hr = "HR"
		case cu = "CU"
		case cy = "CY"
		case cz = "CZ"
		case dk = "DK"
		case dj = "DJ"
		case dm = "DM"
		case cityDO = "DO"
		case tp = "TP"
		case ec = "EC"
		case eg = "EG"
		case sv = "SV"
		case gq = "GQ"
		case er = "ER"
		case ee = "EE"
		case et = "ET"
		case fk = "FK"
		case fo = "FO"
		case fj = "FJ"
		case fi = "FI"
		case fr = "FR"
		case fx = "FX"
		case gf = "GF"
		case pf = "PF"
		case tf = "TF"
		case ga = "GA"
		case gm = "GM"
		case ge = "GE"
		case de = "DE"
		case gh = "GH"
		case gi = "GI"
		case gr = "GR"
		case gl = "GL"
		case gd = "GD"
		case gp = "GP"
		case gu = "GU"
		case gt = "GT"
		case gn = "GN"
		case gw = "GW"
		case gy = "GY"
		case ht = "HT"
		case hm = "HM"
		case hn = "HN"
		case hk = "HK"
		case hu = "HU"
		case cityIS = "IS"
		case cityIN = "IN"
		case id = "ID"
		case iq = "IQ"
		case ie = "IE"
		case ir = "IR"
		case il = "IL"
		case it = "IT"
		case jm = "JM"
		case jp = "JP"
		case jo = "JO"
		case kz = "KZ"
		case ke = "KE"
		case ki = "KI"
		case kr = "KR"
		case kw = "KW"
		case kg = "KG"
		case la = "LA"
		case lv = "LV"
		case lb = "LB"
		case ls = "LS"
		case lr = "LR"
		case ly = "LY"
		case li = "LI"
		case lt = "LT"
		case lu = "LU"
		case mo = "MO"
		case mg = "MG"
		case mw = "MW"
		case my = "MY"
		case mv = "MV"
		case ml = "ML"
		case mt = "MT"
		case mh = "MH"
		case mq = "MQ"
		case mr = "MR"
		case mu = "MU"
		case yt = "YT"
		case mx = "MX"
		case fm = "FM"
		case md = "MD"
		case mc = "MC"
		case mn = "MN"
		case ms = "MS"
		case ma = "MA"
		case mz = "MZ"
		case mm = "MM"
		case na = "NA"
		case nr = "NR"
		case np = "NP"
		case nl = "NL"
		case an = "AN"
		case nc = "NC"
		case nz = "NZ"
		case ni = "NI"
		case ne = "NE"
		case ng = "NG"
		case nu = "NU"
		case nf = "NF"
		case mp = "MP"
		case no = "NO"
		case om = "OM"
		case pk = "PK"
		case pw = "PW"
		case pa = "PA"
		case pg = "PG"
		case py = "PY"
		case pe = "PE"
		case ph = "PH"
		case pn = "PN"
		case pl = "PL"
		case pt = "PT"
		case pr = "PR"
		case qa = "QA"
		case re = "RE"
		case ro = "RO"
		case ru = "RU"
		case rw = "RW"
		case lc = "LC"
		case ws = "WS"
		case sm = "SM"
		case st = "ST"
		case sa = "SA"
		case sn = "SN"
		case sc = "SC"
		case sl = "SL"
		case sg = "SG"
		case sk = "SK"
		case si = "SI"
		case sb = "SB"
		case so = "SO"
		case za = "ZA"
		case es = "ES"
		case lk = "LK"
		case sh = "SH"
		case kn = "KN"
		case pm = "PM"
		case vc = "VC"
		case sd = "SD"
		case sr = "SR"
		case sj = "SJ"
		case sz = "SZ"
		case se = "SE"
		case ch = "CH"
		case sy = "SY"
		case tw = "TW"
		case tj = "TJ"
		case tz = "TZ"
		case th = "TH"
		case tg = "TG"
		case tk = "TK"
		case to = "TO"
		case tt = "TT"
		case tn = "TN"
		case tr = "TR"
		case tm = "TM"
		case tc = "TC"
		case tv = "TV"
		case ug = "UG"
		case ua = "UA"
		case ae = "AE"
		case gb = "GB"
		case um = "UM"
		case vi = "VI"
		case uy = "UY"
		case uz = "UZ"
		case vu = "VU"
		case va = "VA"
		case ve = "VE"
		case vn = "VN"
		case wf = "WF"
		case eh = "EH"
		case ye = "YE"
		case yu = "YU"
		case zr = "ZR"
		case zm = "ZM"
		case zw = "ZW"
	}
}

// MARK: - ADCity
struct ADCity: Codable {
	let name: String?
	let states: [String: Ad]?
	let coordinates: String?
	let coordinatesAccuracyLevel: CoordinatesAccuracyLevel?
	let cities: [String: ADCity]?

	enum CodingKeys: String, CodingKey {
		case name, states, coordinates
		case coordinatesAccuracyLevel = "coordinates_accuracy_level"
		case cities
	}
}

// MARK: - Ad
struct Ad: Codable {
	let name: String?
	let states: [String: Ad]?
	let coordinates: String?
	let coordinatesAccuracyLevel: CoordinatesAccuracyLevel?
	let cities: [String: ADCity]?

	enum CodingKeys: String, CodingKey {
		case name, states, coordinates
		case coordinatesAccuracyLevel = "coordinates_accuracy_level"
		case cities
	}
}

enum CoordinatesAccuracyLevel: String, Codable {
	case city = "city"
	case country = "country"
	case state = "state"
}

// MARK: - Ag
struct Ag: Codable {
	let name: String?
	let states: [String: Ad]?
}

// MARK: - Aq
struct Aq: Codable {
	let name: String?
	let states: States?
}

// MARK: - States
struct States: Codable {
}

// MARK: - Md
struct Md: Codable {
	let name: String?
	let states: [String: State]?
}

// MARK: - State
struct State: Codable {
	let name: String?
	let cities: [String: PurpleCity]?
}

// MARK: - PurpleCity
struct PurpleCity: Codable {
	let name: String?
}

// MARK: - Tz
struct Tz: Codable {
	let name: String?
	let states: [String: State]?
}
