-- Clear existing users
DELETE FROM user;

-- Hotel 1: The Oberoi Bangalore (tob)
INSERT INTO user (username, first_name, last_name, role, hotel_name, display_name, email, password_hash) VALUES
('alice_tob','Alice','Johnson','ADMIN','The Oberoi Bangalore','Alice Johnson - ADMIN @ The Oberoi Bangalore','alice.johnson@oberoi.com','hashed_password1'),
('bob_tob','Bob','Smith','MANAGER','The Oberoi Bangalore','Bob Smith - MANAGER @ The Oberoi Bangalore','bob.smith@oberoi.com','hashed_password2'),
('carol_tob','Carol','Davis','RECEPTION','The Oberoi Bangalore','Carol Davis - RECEPTION @ The Oberoi Bangalore','carol.davis@oberoi.com','hashed_password3'),
('dave_tob','Dave','Brown','HOUSEKEEPING','The Oberoi Bangalore','Dave Brown - HOUSEKEEPING @ The Oberoi Bangalore','dave.brown@oberoi.com','hashed_password4');

-- Hotel 2: Taj Palace Delhi (tpd)
INSERT INTO user VALUES
('emma_tpd','Emma','Wilson','ADMIN','Taj Palace Delhi','Emma Wilson - ADMIN @ Taj Palace Delhi','emma.wilson@tajpalace.com','hashed_password5'),
('frank_tpd','Frank','Moore','MANAGER','Taj Palace Delhi','Frank Moore - MANAGER @ Taj Palace Delhi','frank.moore@tajpalace.com','hashed_password6'),
('grace_tpd','Grace','Taylor','RECEPTION','Taj Palace Delhi','Grace Taylor - RECEPTION @ Taj Palace Delhi','grace.taylor@tajpalace.com','hashed_password7'),
('harry_tpd','Harry','Anderson','HOUSEKEEPING','Taj Palace Delhi','Harry Anderson - HOUSEKEEPING @ Taj Palace Delhi','harry.anderson@tajpalace.com','hashed_password8');

-- Hotel 3: ITC Grand Chola (itc)
INSERT INTO user VALUES
('isabella_itc','Isabella','Thomas','ADMIN','ITC Grand Chola','Isabella Thomas - ADMIN @ ITC Grand Chola','isabella.thomas@itcchola.com','hashed_password9'),
('jack_itc','Jack','Harris','MANAGER','ITC Grand Chola','Jack Harris - MANAGER @ ITC Grand Chola','jack.harris@itcchola.com','hashed_password10'),
('kate_itc','Kate','Martin','RECEPTION','ITC Grand Chola','Kate Martin - RECEPTION @ ITC Grand Chola','kate.martin@itcchola.com','hashed_password11'),
('leo_itc','Leo','Clark','HOUSEKEEPING','ITC Grand Chola','Leo Clark - HOUSEKEEPING @ ITC Grand Chola','leo.clark@itcchola.com','hashed_password12');

-- Hotel 4: The Leela Mumbai (tlm)
INSERT INTO user VALUES
('mia_tlm','Mia','Walker','ADMIN','The Leela Mumbai','Mia Walker - ADMIN @ The Leela Mumbai','mia.walker@leela.com','hashed_password13'),
('noah_tlm','Noah','Hall','MANAGER','The Leela Mumbai','Noah Hall - MANAGER @ The Leela Mumbai','noah.hall@leela.com','hashed_password14'),
('olivia_tlm','Olivia','Allen','RECEPTION','The Leela Mumbai','Olivia Allen - RECEPTION @ The Leela Mumbai','olivia.allen@leela.com','hashed_password15'),
('peter_tlm','Peter','Young','HOUSEKEEPING','The Leela Mumbai','Peter Young - HOUSEKEEPING @ The Leela Mumbai','peter.young@leela.com','hashed_password16');

-- Hotel 5: Hyatt Regency Kolkata (hrk)
INSERT INTO user VALUES
('quinn_hrk','Quinn','King','ADMIN','Hyatt Regency Kolkata','Quinn King - ADMIN @ Hyatt Regency Kolkata','quinn.king@hyatt.com','hashed_password17'),
('rachel_hrk','Rachel','Wright','MANAGER','Hyatt Regency Kolkata','Rachel Wright - MANAGER @ Hyatt Regency Kolkata','rachel.wright@hyatt.com','hashed_password18'),
('sam_hrk','Sam','Lopez','RECEPTION','Hyatt Regency Kolkata','Sam Lopez - RECEPTION @ Hyatt Regency Kolkata','sam.lopez@hyatt.com','hashed_password19'),
('tina_hrk','Tina','Hill','HOUSEKEEPING','Hyatt Regency Kolkata','Tina Hill - HOUSEKEEPING @ Hyatt Regency Kolkata','tina.hill@hyatt.com','hashed_password20');

-- Hotel 6: Radisson Blu Jaipur (rbj)
INSERT INTO user VALUES
('uma_rbj','Uma','Scott','ADMIN','Radisson Blu Jaipur','Uma Scott - ADMIN @ Radisson Blu Jaipur','uma.scott@radisson.com','hashed_password21'),
('victor_rbj','Victor','Adams','MANAGER','Radisson Blu Jaipur','Victor Adams - MANAGER @ Radisson Blu Jaipur','victor.adams@radisson.com','hashed_password22'),
('wendy_rbj','Wendy','Baker','RECEPTION','Radisson Blu Jaipur','Wendy Baker - RECEPTION @ Radisson Blu Jaipur','wendy.baker@radisson.com','hashed_password23'),
('xander_rbj','Xander','Carter','HOUSEKEEPING','Radisson Blu Jaipur','Xander Carter - HOUSEKEEPING @ Radisson Blu Jaipur','xander.carter@radisson.com','hashed_password24');

-- Hotel 7: Marriott Hyderabad (mh)
INSERT INTO user VALUES
('yara_mh','Yara','Evans','ADMIN','Marriott Hyderabad','Yara Evans - ADMIN @ Marriott Hyderabad','yara.evans@marriott.com','hashed_password25'),
('zane_mh','Zane','Turner','MANAGER','Marriott Hyderabad','Zane Turner - MANAGER @ Marriott Hyderabad','zane.turner@marriott.com','hashed_password26'),
('amelia_mh','Amelia','Perry','RECEPTION','Marriott Hyderabad','Amelia Perry - RECEPTION @ Marriott Hyderabad','amelia.perry@marriott.com','hashed_password27'),
('brian_mh','Brian','Russell','HOUSEKEEPING','Marriott Hyderabad','Brian Russell - HOUSEKEEPING @ Marriott Hyderabad','brian.russell@marriott.com','hashed_password28');

-- Hotel 8: Novotel Goa Resort (ngr)
INSERT INTO user VALUES
('clara_ngr','Clara','Howard','ADMIN','Novotel Goa Resort','Clara Howard - ADMIN @ Novotel Goa Resort','clara.howard@novotel.com','hashed_password29'),
('daniel_ngr','Daniel','Bell','MANAGER','Novotel Goa Resort','Daniel Bell - MANAGER @ Novotel Goa Resort','daniel.bell@novotel.com','hashed_password30'),
('ella_ngr','Ella','Murphy','RECEPTION','Novotel Goa Resort','Ella Murphy - RECEPTION @ Novotel Goa Resort','ella.murphy@novotel.com','hashed_password31'),
('felix_ngr','Felix','Ward','HOUSEKEEPING','Novotel Goa Resort','Felix Ward - HOUSEKEEPING @ Novotel Goa Resort','felix.ward@novotel.com','hashed_password32');

-- Hotel 9: Vivanta Coimbatore (vc)
INSERT INTO user VALUES
('gina_vc','Gina','Cook','ADMIN','Vivanta Coimbatore','Gina Cook - ADMIN @ Vivanta Coimbatore','gina.cook@vivanta.com','hashed_password33'),
('henry_vc','Henry','Rogers','MANAGER','Vivanta Coimbatore','Henry Rogers - MANAGER @ Vivanta Coimbatore','henry.rogers@vivanta.com','hashed_password34'),
('ivy_vc','Ivy','Morgan','RECEPTION','Vivanta Coimbatore','Ivy Morgan - RECEPTION @ Vivanta Coimbatore','ivy.morgan@vivanta.com','hashed_password35'),
('jackson_vc','Jackson','Reed','HOUSEKEEPING','Vivanta Coimbatore','Jackson Reed - HOUSEKEEPING @ Vivanta Coimbatore','jackson.reed@vivanta.com','hashed_password36');

-- Hotel 10: Crown Plaza Ahmedabad (cpa)
INSERT INTO user VALUES
('kate_cpa','Kate','Cook','ADMIN','Crown Plaza Ahmedabad','Kate Cook - ADMIN @ Crown Plaza Ahmedabad','kate.cook@crownplaza.com','hashed_password37'),
('liam_cpa','Liam','Foster','MANAGER','Crown Plaza Ahmedabad','Liam Foster - MANAGER @ Crown Plaza Ahmedabad','liam.foster@crownplaza.com','hashed_password38'),
('mia_cpa','Mia','Griffin','RECEPTION','Crown Plaza Ahmedabad','Mia Griffin - RECEPTION @ Crown Plaza Ahmedabad','mia.griffin@crownplaza.com','hashed_password39'),
('noah_cpa','Noah','Hughes','HOUSEKEEPING','Crown Plaza Ahmedabad','Noah Hughes - HOUSEKEEPING @ Crown Plaza Ahmedabad','noah.hughes@crownplaza.com','hashed_password40');

-- Hotel 11: Mandarin Oriental Singapore (mos)
INSERT INTO user VALUES
('olivia_mos','Olivia','Ward','ADMIN','Mandarin Oriental Singapore','Olivia Ward - ADMIN @ Mandarin Oriental Singapore','olivia.ward@mandarin.com','hashed_password41'),
('peter_mos','Peter','Foster','MANAGER','Mandarin Oriental Singapore','Peter Foster - MANAGER @ Mandarin Oriental Singapore','peter.foster@mandarin.com','hashed_password42'),
('quinn_mos','Quinn','Price','RECEPTION','Mandarin Oriental Singapore','Quinn Price - RECEPTION @ Mandarin Oriental Singapore','quinn.price@mandarin.com','hashed_password43'),
('rachel_mos','Rachel','Bennett','HOUSEKEEPING','Mandarin Oriental Singapore','Rachel Bennett - HOUSEKEEPING @ Mandarin Oriental Singapore','rachel.bennett@mandarin.com','hashed_password44');

-- Hotel 12: The Ritz London (trl)
INSERT INTO user VALUES
('sam_trl','Sam','Murphy','ADMIN','The Ritz London','Sam Murphy - ADMIN @ The Ritz London','sam.murphy@ritz.com','hashed_password45'),
('tina_trl','Tina','Bailey','MANAGER','The Ritz London','Tina Bailey - MANAGER @ The Ritz London','tina.bailey@ritz.com','hashed_password46'),
('uma_trl','Uma','Cooper','RECEPTION','The Ritz London','Uma Cooper - RECEPTION @ The Ritz London','uma.cooper@ritz.com','hashed_password47'),
('victor_trl','Victor','Howard','HOUSEKEEPING','The Ritz London','Victor Howard - HOUSEKEEPING @ The Ritz London','victor.howard@ritz.com','hashed_password48');

-- Hotel 13: Burj Al Arab (baa)
INSERT INTO user VALUES
('wendy_baa','Wendy','Ward','ADMIN','Burj Al Arab','Wendy Ward - ADMIN @ Burj Al Arab','wendy.ward@burjalarab.com','hashed_password49'),
('xander_baa','Xander','Scott','MANAGER','Burj Al Arab','Xander Scott - MANAGER @ Burj Al Arab','xander.scott@burjalarab.com','hashed_password50'),
('yara_baa','Yara','Parker','RECEPTION','Burj Al Arab','Yara Parker - RECEPTION @ Burj Al Arab','yara.parker@burjalarab.com','hashed_password51'),
('zane_baa','Zane','Collins','HOUSEKEEPING','Burj Al Arab','Zane Collins - HOUSEKEEPING @ Burj Al Arab','zane.collins@burjalarab.com','hashed_password52');

-- Hotel 14: Marina Bay Sands (mbs)
INSERT INTO user VALUES
('amelia_mbs','Amelia','Kelly','ADMIN','Marina Bay Sands','Amelia Kelly - ADMIN @ Marina Bay Sands','amelia.kelly@marinabaysands.com','hashed_password53'),
('brian_mbs','Brian','Morgan','MANAGER','Marina Bay Sands','Brian Morgan - MANAGER @ Marina Bay Sands','brian.morgan@marinabaysands.com','hashed_password54'),
('clara_mbs','Clara','Bell','RECEPTION','Marina Bay Sands','Clara Bell - RECEPTION @ Marina Bay Sands','clara.bell@marinabaysands.com','hashed_password55'),
('daniel_mbs','Daniel','Wright','HOUSEKEEPING','Marina Bay Sands','Daniel Wright - HOUSEKEEPING @ Marina Bay Sands','daniel.wright@marinabaysands.com','hashed_password56');

-- Hotel 15: The Plaza New York (tpn)
INSERT INTO user VALUES
('ella_tpn','Ella','Scott','ADMIN','The Plaza New York','Ella Scott - ADMIN @ The Plaza New York','ella.scott@plaza.com','hashed_password57'),
('felix_tpn','Felix','Gray','MANAGER','The Plaza New York','Felix Gray - MANAGER @ The Plaza New York','felix.gray@plaza.com','hashed_password58'),
('gina_tpn','Gina','Hughes','RECEPTION','The Plaza New York','Gina Hughes - RECEPTION @ The Plaza New York','gina.hughes@plaza.com','hashed_password59'),
('henry_tpn','Henry','Ross','HOUSEKEEPING','The Plaza New York','Henry Ross - HOUSEKEEPING @ The Plaza New York','henry.ross@plaza.com','hashed_password60');

-- Hotel 16: Shangri-La Tokyo (slt)
INSERT INTO user VALUES
('ivy_slt','Ivy','Kelly','ADMIN','Shangri-La Tokyo','Ivy Kelly - ADMIN @ Shangri-La Tokyo','ivy.kelly@shangri-la.com','hashed_password61'),
('jack_slt','Jack','Perry','MANAGER','Shangri-La Tokyo','Jack Perry - MANAGER @ Shangri-La Tokyo','jack.perry@shangri-la.com','hashed_password62'),
('kate_slt','Kate','Carter','RECEPTION','Shangri-La Tokyo','Kate Carter - RECEPTION @ Shangri-La Tokyo','kate.carter@shangri-la.com','hashed_password63'),
('leo_slt','Leo','Murphy','HOUSEKEEPING','Shangri-La Tokyo','Leo Murphy - HOUSEKEEPING @ Shangri-La Tokyo','leo.murphy@shangri-la.com','hashed_password64');

-- Hotel 17: Four Seasons Sydney (fss)
INSERT INTO user VALUES
('mia_fss','Mia','Ross','ADMIN','Four Seasons Sydney','Mia Ross - ADMIN @ Four Seasons Sydney','mia.ross@fourseasons.com','hashed_password65'),
('noah_fss','Noah','Collins','MANAGER','Four Seasons Sydney','Noah Collins - MANAGER @ Four Seasons Sydney','noah.collins@fourseasons.com','hashed_password66'),
('olivia_fss','Olivia','Edwards','RECEPTION','Four Seasons Sydney','Olivia Edwards - RECEPTION @ Four Seasons Sydney','olivia.edwards@fourseasons.com','hashed_password67'),
('peter_fss','Peter','Cox','HOUSEKEEPING','Four Seasons Sydney','Peter Cox - HOUSEKEEPING @ Four Seasons Sydney','peter.cox@fourseasons.com','hashed_password68');

-- Hotel 18: Hotel de Paris Monaco (hdpm)
INSERT INTO user VALUES
('quinn_hdpm','Quinn','Reed','ADMIN','Hotel de Paris Monaco','Quinn Reed - ADMIN @ Hotel de Paris Monaco','quinn.reed@monaco.com','hashed_password69'),
('rachel_hdpm','Rachel','Ward','MANAGER','Hotel de Paris Monaco','Rachel Ward - MANAGER @ Hotel de Paris Monaco','rachel.ward@monaco.com','hashed_password70'),
('sam_hdpm','Sam','Brooks','RECEPTION','Hotel de Paris Monaco','Sam Brooks - RECEPTION @ Hotel de Paris Monaco','sam.brooks@monaco.com','hashed_password71'),
('tina_hdpm','Tina','Cole','HOUSEKEEPING','Hotel de Paris Monaco','Tina Cole - HOUSEKEEPING @ Hotel de Paris Monaco','tina.cole@monaco.com','hashed_password72');

-- Hotel 19: Raffles Singapore (rs)
INSERT INTO user VALUES
('uma_rs','Uma','Gray','ADMIN','Raffles Singapore','Uma Gray - ADMIN @ Raffles Singapore','uma.gray@raffles.com','hashed_password73'),
('victor_rs','Victor','Ross','MANAGER','Raffles Singapore','Victor Ross - MANAGER @ Raffles Singapore','victor.ross@raffles.com','hashed_password74'),
('wendy_rs','Wendy','Hughes','RECEPTION','Raffles Singapore','Wendy Hughes - RECEPTION @ Raffles Singapore','wendy.hughes@raffles.com','hashed_password75'),
('xander_rs','Xander','Perry','HOUSEKEEPING','Raffles Singapore','Xander Perry - HOUSEKEEPING @ Raffles Singapore','xander.perry@raffles.com','hashed_password76');

-- Hotel 20: The Peninsula Hong Kong (tphk)
INSERT INTO user VALUES
('yara_tphk','Yara','Carter','ADMIN','The Peninsula Hong Kong','Yara Carter - ADMIN @ The Peninsula Hong Kong','yara.carter@peninsula.com','hashed_password77'),
('zane_tphk','Zane','Brooks','MANAGER','The Peninsula Hong Kong','Zane Brooks - MANAGER @ The Peninsula Hong Kong','zane.brooks@peninsula.com','hashed_password78'),
('amelia_tphk','Amelia','Gray','RECEPTION','The Peninsula Hong Kong','Amelia Gray - RECEPTION @ The Peninsula Hong Kong','amelia.gray@peninsula.com','hashed_password79'),
('brian_tphk','Brian','Cox','HOUSEKEEPING','The Peninsula Hong Kong','Brian Cox - HOUSEKEEPING @ The Peninsula Hong Kong','brian.cox@peninsula.com','hashed_password80');
