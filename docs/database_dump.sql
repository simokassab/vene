--
-- PostgreSQL database dump
--

\restrict R04QUMvFt21pF8cEFkbUn6PsggSpht67UU25qDlF9WeLfitwwc9RxFt9FQDlcMW

-- Dumped from database version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 17.7 (Ubuntu 17.7-0ubuntu0.25.10.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'admin@example.com', '$2a$12$UNcchS09GNmKVsBoekSucOcUcuULlPYyfHirMN1gXlhFQV6827NoW', NULL, NULL, NULL, 'Admin', '+96100000000', 'admin', NULL, NULL, NULL, '2025-12-01 22:59:02.623701', '2025-12-01 22:59:02.623701');
INSERT INTO public.users VALUES (2, 'mohammad.a.kassab@gmail.com', '$2a$12$vMeDimtHlEZoPMyWJ8WbQeSa.eHwo6evBNWR4jABiEhIfV0a.gHSO', NULL, NULL, NULL, 'Mohammad KASSAB', '+96171444501', 'customer', 'Lebanon', 'Sidon', 'Myeh w Myeh - Hamchary Street', '2025-12-17 12:54:42.850323', '2025-12-17 12:54:42.850323');
INSERT INTO public.users VALUES (3, 'nadinekaakati@gmail.com', '$2a$12$yP04SzWjQpcSHrfNh2khleI8ytZebdesd9xKt4AO8cSLyJt84z1dm', NULL, NULL, NULL, 'Nadine', '+966555103376', 'customer', 'SA', 'Riyadh', '2311, 7747 Ibn Saneen Street
Al Ulayah Al Janoubiyah', '2026-01-27 07:39:18.220031', '2026-01-27 07:39:18.220031');


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.ar_internal_metadata VALUES ('environment', 'development', '2025-12-01 22:58:47.400062', '2025-12-01 22:58:47.40007');
INSERT INTO public.ar_internal_metadata VALUES ('schema_sha1', 'c5eb17051e1427bcc278471e9ea34175196e2c3f', '2025-12-01 22:58:47.414048', '2025-12-01 22:58:47.414055');


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.categories VALUES (5, 'Wedding and Engagement Jewelry', 'حيث يبدأ الحب حياة جديدة', 'Wedding and Engagement Rings', true, 4, '2025-12-09 05:28:09.369082', '2025-12-20 10:53:52.998585', 'White_wedding_banner.png');
INSERT INTO public.categories VALUES (4, 'Earrings', 'أقراط', 'earrings', true, 0, '2025-12-01 22:59:02.944558', '2026-01-27 07:10:15.323593', 'Earrings(2).44b59.jpg');
INSERT INTO public.categories VALUES (1, 'Necklaces', 'قلادات', 'necklaces', true, 0, '2025-12-01 22:59:02.761373', '2026-01-27 07:10:28.581568', 'Ocean_light_banner_2.png');
INSERT INTO public.categories VALUES (2, 'Bracelets', 'أساور', 'bracelets', true, 0, '2025-12-01 22:59:02.787005', '2026-01-27 07:11:10.26436', 'Hearts_Bracelet_Navy_blue_banner.JPG');
INSERT INTO public.categories VALUES (3, 'Rings', 'خواتم', 'rings', true, 0, '2025-12-01 22:59:02.821456', '2026-01-27 07:13:30.50163', 'RG_Love_Harmony_Ring_Banner.JPG');
INSERT INTO public.categories VALUES (6, 'Mother''s Day', 'يوم الأم', 'Mother''s Day', true, 5, '2025-12-17 08:39:23.835115', '2026-01-30 10:52:34.894117', NULL);


--
-- Data for Name: sub_categories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sub_categories VALUES (7, 3, 'White Gold Rings', 'خواتم الذهب الأبيض', 'rings-white-gold-rings', '', '', 'WG_Peach_Morganite_.jpeg', true, 1, '2025-12-15 05:53:20.122092', '2025-12-15 05:53:20.122092');
INSERT INTO public.sub_categories VALUES (4, 4, 'White Gold Earrings', 'أقراط من الذهب الأبيض', 'earrings-white-gold-earrings', '', '', 'Solar_Flora_2_Earrings.jpg', true, 0, '2025-12-14 22:28:36.496322', '2026-01-22 19:25:52.055078');
INSERT INTO public.sub_categories VALUES (8, 3, 'Yellow Gold Rings', 'خواتم الذهب الأصفر', 'rings-yellow-gold-rings', '', '', 'YG_Vetra_ring.png', true, 0, '2025-12-15 12:02:04.081875', '2025-12-15 12:02:04.081875');
INSERT INTO public.sub_categories VALUES (6, 3, 'Rose Gold Rings', 'خواتم الذهب الوردي', 'earrings-rose-gold-earrings', '', '', 'RG_Love_Harmony_Ring.jpeg', true, 2, '2025-12-15 05:50:19.645297', '2025-12-15 12:04:03.879288');
INSERT INTO public.sub_categories VALUES (23, 4, 'Yellow Gold Earrings', 'أقراط الذهب الأصفر', 'earrings-yellow-gold-earrings', '', '', 'YG_Beirut_domes_Earrings.jpeg', true, 0, '2026-01-23 18:48:03.116431', '2026-01-23 18:48:03.116431');
INSERT INTO public.sub_categories VALUES (22, 4, 'Rose Gold Earrings', 'أقراط الذهب الوردي', 'earrings-rose-gold-earrings-1', '', '', 'RG_Wing_Earrings_Top_View.jpeg', true, 0, '2026-01-23 18:46:36.679421', '2026-01-27 16:46:42.365763');
INSERT INTO public.sub_categories VALUES (10, 1, 'White Gold Necklaces', 'سلاسل وقلادات الذهب الأبيض', 'necklaces-white-gold-necklaces', '', '', 'Infinte_Love_Necklace__studio_.jpg', true, 1, '2025-12-15 12:18:24.008452', '2026-01-29 16:03:15.605038');
INSERT INTO public.sub_categories VALUES (1, 1, 'General Necklaces', 'جميع السلاسل والقلادات', 'necklaces-general', '', '', 'Black_heart-_mother_necklace.JPG', true, 0, '2025-12-14 22:28:36.403783', '2025-12-15 12:15:45.506015');
INSERT INTO public.sub_categories VALUES (11, 1, 'Yellow Gold Necklaces', 'سلاسل وقلادات الذهب الأصفر', 'necklaces-yellow-gold-necklaces', '', '', 'YG_flower_yellow_stone_pendant_front_view.jpeg', true, 0, '2025-12-15 12:22:42.25949', '2025-12-15 12:22:42.25949');
INSERT INTO public.sub_categories VALUES (13, 2, 'Rose Gold Bracelets', 'أساور من الذهب الوردي', 'bracelets-rose-gold-bracelets', '', '', 'RG_Hearts_Braclet_2.jpeg', true, 0, '2025-12-15 12:46:32.059396', '2025-12-15 12:46:32.059396');
INSERT INTO public.sub_categories VALUES (2, 2, 'General Bracelets', 'جميع الأساور ', 'bracelets-white-gold-bracelets', '', '', 'WG_V_by_Vene.jpeg', true, 0, '2025-12-14 22:28:36.456404', '2025-12-15 12:55:24.022064');
INSERT INTO public.sub_categories VALUES (14, 2, 'White Gold Bracelets', 'أساور من الذهب الأبيض', 'bracelets-white-gold-bracelets-1', '', '', 'WG_Candy_Bracelet.jpeg', true, 0, '2025-12-15 12:58:00.937681', '2025-12-15 13:05:17.276289');
INSERT INTO public.sub_categories VALUES (3, 3, 'General Rings', 'جميع الخواتم', 'rings-general', '', '', 'WG_Evergreen_crown_ring_top_view.jpeg', true, 0, '2025-12-14 22:28:36.475138', '2025-12-15 18:20:20.39819');
INSERT INTO public.sub_categories VALUES (5, 5, 'Wedding and Engagement Rings', 'خواتم ومحابس الزواج ', 'Engagement Rings-engagement-rings', '', '', 'WG_Vetra_ring.png', true, 0, '2025-12-14 22:28:36.511924', '2025-12-15 20:52:43.600539');
INSERT INTO public.sub_categories VALUES (16, 2, 'Yellow Gold Bracelets', 'أساور من الذهب الأصفر', 'bracelets-yellow-gold-bracelets-1', '', '', 'YG_Vetra_Bracelet.jpeg', true, 0, '2025-12-15 21:21:24.002818', '2025-12-15 21:21:24.002818');
INSERT INTO public.sub_categories VALUES (17, 5, 'Rose Gold Engagement Rings', 'خواتم الزواج من الذهب الوردي', 'Engagement Rings-rose-gold-engagement-rings', '', '', 'RG_Peach_Morganite_Ring.jpeg', true, 0, '2025-12-16 11:47:30.647116', '2025-12-16 11:47:30.647116');
INSERT INTO public.sub_categories VALUES (18, 5, 'Yellow Gold Engagement Rings', 'خواتم الزواج من الذهب الأصفر', 'Engagement Rings-yellow-gold-engagement-rings', '', '', 'YG_Vetra_ring.png', true, 0, '2025-12-16 11:48:25.964888', '2025-12-16 11:48:25.964888');
INSERT INTO public.sub_categories VALUES (19, 5, 'White Gold Engagement Rings', 'خواتم الزواج من الذهب الأبيض', 'Engagement Rings-white-gold-engagement-rings', '', '', 'WG_Vetra_ring.png', true, 0, '2025-12-16 11:49:20.500942', '2025-12-16 11:49:20.500942');
INSERT INTO public.sub_categories VALUES (20, 6, 'Yellow Gold Mother''s Day Jewelry', 'مجوهرات يوم الأم من الذهب الأصفر', 'Mother''s Day-yellow-gold-mother-s-day-jewelry', '', '', '2_mother_necklaces.JPG', true, 0, '2025-12-17 09:05:27.904611', '2025-12-17 09:09:20.758864');
INSERT INTO public.sub_categories VALUES (21, 6, 'White Gold Mother''s Day Jewelry', 'مجوهرات يوم الأم من الذهب الأبيض', 'Mother''s Day-white-gold-mother-s-day-jewelry', '', '', NULL, true, 0, '2025-12-17 09:10:44.474367', '2025-12-17 09:10:44.474367');
INSERT INTO public.sub_categories VALUES (9, 1, 'Rose Gold Necklaces', 'سلاسل وقلادات الذهب الوردي', 'necklaces-rose-gold-necklaces', '', '', 'RG_Pacman_Front_view.jpeg', true, 0, '2025-12-15 12:17:11.712553', '2026-01-22 11:58:39.563273');


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.products VALUES (75, 'V By VENÈ ', 'V By VENÈ', 'A Bold yet sophisticated piece that brings structure, shine, and confidence to the wrist.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'قطعة جريئة وأنيقة في الوقت نفسه، تضفي على المعصم هيكلاً ولمعاناً وثقة

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 1866.00, 1, '18K White Gold', 'Natural Diamonds', '', true, 'v-by-vene-2', '2025-12-16 18:39:05.887697', '2026-01-23 20:07:52.200766', false, false, NULL, 'WG_V_by_Vene._video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 14, '');
INSERT INTO public.products VALUES (55, 'Blush Promise ', 'Blush Promise', 'Elegant, intimate, and timeless, Blush Promise is a vow made visible — a ring for the love you carry softly, yet forever.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us', 'أنيق، حميمي، وخالد، خاتم "بلاش بروميس" هو عهدٌ مُجسّد - خاتمٌ للحب الذي تحملينه برقة، ولكنه أبدي

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، كما أنها تختلف باختلاف حجم الخاتم الذي تطلبينه.
  لمزيد من المعلومات، يرجى التواصل معنا
', 2527.00, 1, '18K Rose Gold', 'Natural Diamonds', 'Ruby', true, 'blush-promise-2', '2025-12-15 17:52:38.151755', '2026-01-23 19:55:16.382851', false, false, NULL, 'RG_Blush_Promise_Ring_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 3, '');
INSERT INTO public.products VALUES (44, 'Love Harmony', ' تناغم الحب', 'A delicate harmony of hearts and petals, the Love Harmony Ring captures the moment when love blossoms into something timeless.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'خاتم تناغم الحب هو تناغم رقيق بين القلوب والبتلات، يلتقط اللحظة التي يزدهر فيها الحب إلى شيء خالد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 2450.00, 0, '18K Yellow Gold', 'Natural Diamonds', '', true, 'love-harmony', '2025-12-15 13:21:46.898508', '2026-01-25 08:21:49.992119', false, false, NULL, 'YG_Love_Harmony_video_1.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 8, '');
INSERT INTO public.products VALUES (111, 'Murmur of the Heart', 'همس القلب', 'Murmur of the Heart ring is the perfect piece to declare your love to someone. expressing your love in a soft, intimate feeling that comes directly from the heart. 

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'خاتم "همس القلب" هو القطعة المثالية للتعبير عن حبك لشخص ما، والتعبير عنه بمشاعر رقيقة وحميمية تنبع مباشرة من 
القلب

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 2200.00, 0, '18K White Gold', 'Natural Diamonds', 'Peach Morganite', true, 'murmur-of-the-heart-6', '2026-01-23 06:49:21.551828', '2026-01-25 08:23:55.872949', false, false, NULL, 'WG_Peach_Morganite_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 7, '');
INSERT INTO public.products VALUES (113, 'Murmur of the Heart', 'همس القلب', 'Murmur of the Heart ring is the perfect piece to declare your love to someone. expressing your love in a soft, intimate feeling that comes directly from the heart. 

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'خاتم "همس القلب" هو القطعة المثالية للتعبير عن حبك لشخص ما، والتعبير عنه بمشاعر رقيقة وحميمية تنبع مباشرة من 
القلب

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2200.00, 0, '18K Rose Gold', 'Natural Diamonds', 'Peach Morganite', true, 'murmur-of-the-heart-8', '2026-01-23 06:54:33.457701', '2026-01-25 08:25:43.289362', false, false, NULL, 'RG_Peach_Morganite_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 6, '');
INSERT INTO public.products VALUES (9, 'Solara Bloom', 'سولارا بلوم', 'Solara Bloom captures the warmth of a sunrise and the tenderness of a flower opening to the light. A glowing yellow gemstone rests at the top like a small sun, radiating warmth and hope. 

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'سولارا بلوم تُجسّد دفء شروق الشمس ونعومة زهرة تتفتح أمام ضوءها. جوهرة صفراء متوهجة تستقر في الأعلى كشمس صغيرة، تشعّ دفئًا وأملًا.

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا.', 1331.00, 1, '18K White Gold', 'Marquise shape natural diamonds', '1 ct  Lemon yellow Moissanite', true, 'N-WG-SB-006', '2025-12-08 17:03:34.972239', '2026-01-22 11:47:48.311341', false, false, NULL, 'WG_flower_yellow_stone_pendant.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 1, '');
INSERT INTO public.products VALUES (23, 'Murmur of the Heart', 'همس القلب', 'Murmur of the Heart ring is the perfect piece to declare your love to someone. expressing your love in a soft, intimate feeling that comes directly from the heart. 

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'خاتم "همس القلب" هو القطعة المثالية للتعبير عن حبك لشخص ما، والتعبير عنه بمشاعر رقيقة وحميمية تنبع مباشرة من القلب.

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا.', 2200.00, 0, '18K Rose Gold', 'Natural Diamonds', 'Peach Morganite', true, 'murmur-of-the-heart-5', '2025-12-10 05:29:35.460154', '2026-01-25 08:29:38.740558', false, false, NULL, 'RG_Peach_Morganite_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 5, '');
INSERT INTO public.products VALUES (77, 'Hearts in Love Bracelet', 'سوار قلوب في الحب', 'An elegant hearts bracelet made to mark you meaningful moment. This bracelet speaks softly but deeply, perfect for wearing alone or stacked

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'سوار أنيق على شكل قلوب، مصمم لتخليد لحظاتك المميزة. هذا السوار يعبّر عن مشاعر رقيقة وعميقة، وهو مثالي للارتداء بمفرده أو مع أساور أخرى

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2600.00, 0, '18K White Gold', 'Natural Diamonds', '', true, 'hearts-in-love-bracelet-5', '2025-12-16 18:44:01.777201', '2026-01-25 08:03:46.503317', false, false, NULL, 'WG_Hearts_Bracelet_2_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 14, '');
INSERT INTO public.products VALUES (24, 'Murmur of the Heart', 'همس القلب', 'Murmur of the Heart ring is the perfect piece to declare your love to someone. expressing your love in a soft, intimate feeling that comes directly from the heart. 

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'خاتم "همس القلب" هو القطعة المثالية للتعبير عن حبك لشخص ما، والتعبير عنه بمشاعر رقيقة وحميمية تنبع مباشرة من القلب.

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2200.00, 0, '18K Yellow Gold', 'Natural Diamonds', 'Peach Morganite', true, 'R-YG-MH-53-008', '2025-12-10 05:34:46.133392', '2026-01-25 08:30:00.134714', false, false, NULL, 'YG_Peach_Morganite_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 5, '');
INSERT INTO public.products VALUES (112, 'Murmur of the Heart', 'همس القلب', 'Murmur of the Heart ring is the perfect piece to declare your love to someone. expressing your love in a soft, intimate feeling that comes directly from the heart. 

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'خاتم "همس القلب" هو القطعة المثالية للتعبير عن حبك لشخص ما، والتعبير عنه بمشاعر رقيقة وحميمية تنبع مباشرة من 
القلب

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2200.00, 0, '18K Yellow Gold', 'Natural Diamonds', 'Peach Morganite', true, 'murmur-of-the-heart-7', '2026-01-23 06:52:15.678014', '2026-01-25 08:30:52.602407', false, false, NULL, 'YG_Peach_Morganite_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 18, '');
INSERT INTO public.products VALUES (59, 'Murmur of the Heart', 'همس القلب', 'Murmur of the Heart ring is the perfect piece to declare your love to someone. expressing your love in a soft, intimate feeling that comes directly from the heart. 

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'خاتم "همس القلب" هو القطعة المثالية للتعبير عن حبك لشخص ما، والتعبير عنه بمشاعر رقيقة وحميمية تنبع مباشرة من القلب

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2200.00, 0, '18K Rose Gold', 'Natural Diamonds', 'Peach Morganite', true, 'murmur-of-the-heart-1', '2025-12-15 18:24:57.613723', '2026-01-25 08:15:06.754307', false, false, NULL, 'RG_Peach_Morganite_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 3, '');
INSERT INTO public.products VALUES (34, 'Hearts in Love Bracelet', 'سوار قلوب في الحب', 'An elegant hearts bracelet made to mark you meaningful moment. This bracelet speaks softly but deeply, perfect for wearing alone or stacked

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'سوار أنيق على شكل قلوب، مصمم لتخليد لحظاتك المميزة. هذا السوار يعبّر عن مشاعر رقيقة وعميقة، وهو مثالي للارتداء بمفرده أو مع أساور أخرى

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 2600.00, 0, '18K Rose Gold', 'Natural Diamonds', '', true, 'hearts-in-love-bracelet', '2025-12-14 07:52:13.634919', '2026-01-25 08:32:51.791439', false, false, NULL, 'RG_Hearts_Braclet_2_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 2, '');
INSERT INTO public.products VALUES (81, 'Ommi Necklace', 'قلادة أمي', 'Express your love for the dearest person to your heart with a heart-shaped necklace featuring the word "Mom" engraved in yellow gold.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'عبري عن حبك لأعز الناس الى قلبك بقلادة على شكل قلب فيها كلمة أمي محفورة بالذهب الأصفر

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1715.00, 1, '18K Yellow Gold', 'Natural Diamonds', '', true, 'ommi-necklace', '2025-12-17 09:08:50.238659', '2026-01-30 10:52:05.369726', false, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 20, '');
INSERT INTO public.products VALUES (26, 'Candy Bracelet', 'سوار كاندي', 'Adorn your hand with Candy Bracelet. Each candy reflects light with a smooth, sculpted finish, creating a joyful rhythm that feels both elegant and modern. Perfect for stacking or wearing alone as a subtle statement of charm and refinement.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'زيّني معصمكِ بسوار كاندي. تعكس كل قطعة حلوى الضوء بلمسة نهائية ناعمة ومنحوتة، لتخلق إيقاعًا بهيجًا يجمع بين الأناقة والعصرية. مثالي للارتداء مع أساور أخرى أو بمفرده كإضافة رقيقة من السحر والرقي

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا.', 2145.00, 0, '18K Rose Gold', 'Natural Diamonds', '', true, 'candy-bracelet-1', '2025-12-12 18:40:36.624849', '2026-01-25 08:33:14.582672', true, false, NULL, 'RG_Candy_Bracelet_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 2, '');
INSERT INTO public.products VALUES (12, 'Vetra', 'فيترا', 'Vetra ring is a bold expression of modern elegance. Crafted in luminous gold, its sculpted geometric pattern creates depth and movement, while the subtle diamond accents add a refined touch of brilliance.
Vetra is designed to those who appreciate artistry, strength, and timeless beauty in a single ring.

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'خاتم فيترا تعبيرٌ جريءٌ عن الأناقة العصرية. مصنوعٌ من الذهب المتألق، يُضفي نمطه الهندسي المنحوت عمقًا وحركةً، بينما تُضفي لمسات الألماس الرقيقة لمسةً راقيةً من التألق.

صُمم فيترا لمن يُقدّرون الفن والقوة والجمال الخالد في خاتمٍ واحد.

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا.', 3005.00, 1, '18K White Gold', 'Natural Diamonds', '', true, 'vetra-2', '2025-12-09 06:07:22.891076', '2026-01-23 19:59:34.610147', false, false, NULL, 'WG_Vetra_ring_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 7, '');
INSERT INTO public.products VALUES (94, 'Vetra', 'فيترا', 'Vetra ring is a bold expression of modern elegance. Crafted in luminous gold, its sculpted geometric pattern creates depth and movement, while the subtle diamond accents add a refined touch of brilliance.
Vetra is designed to those who appreciate artistry, strength, and timeless beauty in a single ring.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'خاتم فيترا تعبيرٌ جريءٌ عن الأناقة العصرية. مصنوعٌ من الذهب المتألق، يُضفي نمطه الهندسي المنحوت عمقًا وحركةً، بينما تُضفي لمسات الألماس الرقيقة لمسةً راقيةً من التألق

صُمم فيترا لمن يُقدّرون الفن والقوة والجمال الخالد في خاتمٍ واحد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3005.00, 1, '18K White Gold', '0.27 Ct Natural Diamonds', '', true, 'vetra-9', '2026-01-13 05:49:07.274579', '2026-01-23 20:10:26.269633', true, false, NULL, 'WG_Vetra_ring_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 19, '');
INSERT INTO public.products VALUES (100, 'Flora Essence Necklace', 'جوهر الزهرة', 'Flora Essence is the spirit of a flower feminine without being fragile, elegant without being loud, and luxurious without being heavy.
A timeless piece that carries beauty, calm, and quiet strength, symbolizing growth, purity, and inner radiance.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.', 'جوهر الزهرة هو روح أنثوية دون أن تكون هشة، أنيقة دون أن تكون صاخبة، وفاخرة دون أن تكون ثقيلة

قطعة خالدة تحمل في طياتها الجمال والهدوء والقوة الكامنة، وترمز إلى النمو والنقاء والإشراق الداخلي

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1900.00, 1, '18K White Gold', 'Natural Diamonds', '', true, 'flora-essence-necklace', '2026-01-22 15:18:41.184838', '2026-01-22 16:17:25.150774', false, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 1, '');
INSERT INTO public.products VALUES (66, 'Vetra Bracelet', 'سوار فيترا', 'Vetra bracelet is a bold expression of modern elegance. Crafted in luminous gold, its sculpted geometric pattern creates depth and movement, while the subtle diamond accents add a refined touch of brilliance.
Vetra is designed to those who appreciate artistry, strength, and timeless beauty.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'سوار فيترا تعبيرٌ جريءٌ عن الأناقة العصرية. مصنوعٌ من الذهب المتألق، يُضفي نمطه الهندسي المنحوت عمقًا وحركةً، بينما تُضفي لمسات الألماس الرقيقة لمسةً راقيةً من التألق.

صُمم فيترا لمن يُقدّرون الفن والقوة والجمال الخالد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 7601.00, 0, '18K Yellow Gold', 'Natural Diamonds', '', true, 'vetra-bracelet-3', '2025-12-16 11:52:55.238252', '2026-01-25 08:35:36.979779', false, false, NULL, 'YG_Vetra_Bracelet_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 16, '');
INSERT INTO public.products VALUES (73, 'Candy Bracelet', 'سوار كاندي', 'Adorn your hand with Candy Bracelet. Each candy reflects light with a smooth, sculpted finish, creating a joyful rhythm that feels both elegant and modern. Perfect for stacking or wearing alone as a subtle statement of charm and refinement.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'زيّني معصمكِ بسوار كاندي. تعكس كل قطعة حلوى الضوء بلمسة نهائية ناعمة ومنحوتة، لتخلق إيقاعًا بهيجًا يجمع بين 
الأناقة والعصرية. مثالي للارتداء مع أساور أخرى أو بمفرده كإضافة رقيقة من السحر والرقي

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، كما أنها تختلف باختلاف حجم الخاتم الذي تطلبينه.
  لمزيد من المعلومات، يرجى التواصل معنا
', 2145.00, 0, '18K Rose Gold', 'Natural Diamonds', '', true, 'candy-bracelet-4', '2025-12-16 13:04:28.891453', '2026-01-25 08:37:37.461398', false, false, NULL, 'RG_Candy_Bracelet_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 13, '');
INSERT INTO public.products VALUES (57, 'Vetra', 'فيترا', 'Vetra ring is a bold expression of modern elegance. Crafted in luminous gold, its sculpted geometric pattern creates depth and movement, while the subtle diamond accents add a refined touch of brilliance.
Vetra is designed to those who appreciate artistry, strength, and timeless beauty in a single ring.

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'خاتم فيترا تعبيرٌ جريءٌ عن الأناقة العصرية. مصنوعٌ من الذهب المتألق، يُضفي نمطه الهندسي المنحوت عمقًا وحركةً، بينما تُضفي لمسات الألماس الرقيقة لمسةً راقيةً من التألق.

صُمم فيترا لمن يُقدّرون الفن والقوة والجمال الخالد في خاتمٍ واحد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 3005.00, 1, '18K Yellow Gold', '0.27 Ct Natural Diamonds', '', true, 'vetra-4', '2025-12-15 18:13:37.484453', '2026-01-22 10:51:10.14263', false, false, NULL, 'YG_Vetra_ring_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 3, '');
INSERT INTO public.products VALUES (45, 'Blush Promise ', 'Blush Promise', 'Elegant, intimate, and timeless, Blush Promise is a vow made visible — a ring for the love you carry softly, yet forever.

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.', 'أنيق، حميمي، وخالد، خاتم "بلاش بروميس" هو عهدٌ مُجسّد - خاتمٌ للحب الذي تحملينه برقة، ولكنه أبدي

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، كما أنها تختلف باختلاف حجم الخاتم الذي تطلبينه. لمزيد من المعلومات، يرجى التواصل معنا

', 2527.00, 0, '18K Yellow Gold', 'Natural Diamonds', 'Ruby', true, 'blush-promise', '2025-12-15 13:57:34.234658', '2026-01-20 05:28:02.064086', false, false, NULL, 'YG_Blush_Promise_Ring_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 8, '');
INSERT INTO public.products VALUES (72, 'Hearts in Love Bracelet', 'سوار قلوب في الحب', 'An elegant hearts bracelet made to mark you meaningful moment. This bracelet speaks softly but deeply, perfect for wearing alone or stacked

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'سوار أنيق على شكل قلوب، مصمم لتخليد لحظاتك المميزة. هذا السوار يعبّر عن مشاعر رقيقة وعميقة، وهو مثالي للارتداء بمفرده أو مع أساور أخرى

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2600.00, 0, '18K Rose Gold', 'Natural Diamonds', '', true, 'hearts-in-love-bracelet-4', '2025-12-16 13:00:15.533447', '2026-01-25 08:38:33.390605', false, false, NULL, 'RG_Hearts_Braclet_2_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 13, '');
INSERT INTO public.products VALUES (60, 'Murmur of the Heart', 'همس القلب', 'Murmur of the Heart ring is the perfect piece to declare your love to someone. expressing your love in a soft, intimate feeling that comes directly from the heart. 

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'خاتم "همس القلب" هو القطعة المثالية للتعبير عن حبك لشخص ما، والتعبير عنه بمشاعر رقيقة وحميمية تنبع مباشرة من 
القلب

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2200.00, 0, '18K White Gold', 'Natural Diamonds', 'Peach Morganite', true, 'murmur-of-the-heart-3', '2025-12-15 18:28:04.77283', '2026-01-25 08:15:41.130013', false, false, NULL, 'WG_Peach_Morganite_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 3, '');
INSERT INTO public.products VALUES (31, 'Hearts in Love -Bracelet chain', 'قلوب في الحب', 'A delicate Hearts in Love bracelet captures the essence of love in its purest form. Designed to symbolize love, connection, and timeless beauty. Crafted with love  to be worn for every day or at your special moments.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'سوار "قلوب في الحب" الرقيق يجسد جوهر الحب في أنقى صوره. صُمم ليرمز إلى الحب والترابط والجمال الخالد. صُنع بحب ليُرتدى كل يوم أو في مناسباتك الخاصة

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 2500.00, 0, '18K Rose Gold', 'Natural Diamonds', '', true, 'hearts-in-love-bracelet-chain', '2025-12-14 05:48:01.548618', '2026-01-25 08:47:18.17138', false, false, NULL, 'RG_Hearts_Bracelet_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 2, '');
INSERT INTO public.products VALUES (108, 'Rosa Light Earrings', 'حلق روزا لايت', 'Rosa Light is a refined piece that feels light, romantic, effortlessly elegant. It reflects purity, and romance. 

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'روزا لايت قطعة راقية تتميز بالخفة والرومانسية والأناقة العفوية. إنها تعكس النقاء والرومانسية

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1850.00, 1, '18K White Gold', '', 'Ruby Fuchsia, Pink Tourmaline, Amethyst, Moissanite', true, 'rosa-light-earrings', '2026-01-22 19:44:42.097407', '2026-01-25 08:49:56.793976', false, false, NULL, NULL, false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 4, 'Enamel');
INSERT INTO public.products VALUES (17, 'Vetra', 'فيترا', 'Vetra ring is a bold expression of modern elegance. Crafted in luminous gold, its sculpted geometric pattern creates depth and movement, while the subtle diamond accents add a refined touch of brilliance.
Vetra is designed to those who appreciate artistry, strength, and timeless beauty in a single ring.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'خاتم فيترا تعبيرٌ جريءٌ عن الأناقة العصرية. مصنوعٌ من الذهب المتألق، يُضفي نمطه الهندسي المنحوت عمقًا وحركةً، بينما تُضفي لمسات الألماس الرقيقة لمسةً راقيةً من التألق.

صُمم فيترا لمن يُقدّرون الفن والقوة والجمال الخالد في خاتمٍ واحد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا


', 2230.00, 0, '18K Rose Gold', 'Natural Diamonds', '', true, 'vetra-3', '2025-12-09 12:08:02.627918', '2026-01-20 05:22:47.12413', false, false, NULL, 'RG_Vetra_ring_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 3, '');
INSERT INTO public.products VALUES (38, 'V By VENÈ', 'V By VENÈ', 'A Bold yet sophisticated piece that brings structure, shine, and confidence to the wrist.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'قطعة جريئة وأنيقة في الوقت نفسه، تضفي على المعصم هيكلاً ولمعاناً وثقة

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 1866.00, 1, '18K Yellow Gold', 'Natural Diamonds', '', true, 'vene', '2025-12-14 08:28:01.94102', '2026-01-22 10:38:22.156916', false, false, NULL, 'YG_V_by_Vene_Bracelet_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 2, '');
INSERT INTO public.products VALUES (48, 'Love Harmony', 'تناغم الحب', 'A delicate harmony of hearts and petals, the Love Harmony Ring captures the moment when love blossoms into something timeless.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'خاتم تناغم الحب هو تناغم رقيق بين القلوب والبتلات، يلتقط اللحظة التي يزدهر فيها الحب إلى شيء خالد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا


', 2450.00, 0, '18K White Gold', 'Natural Diamonds', '', true, 'love-harmony-1', '2025-12-15 15:38:57.134338', '2026-01-25 08:23:17.146003', false, false, NULL, 'WG_Love_Harmony_video_1.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 7, '');
INSERT INTO public.products VALUES (39, 'V By VENÈ', 'V By VENÈ', 'A Bold yet sophisticated piece that brings structure, shine, and confidence to the wrist.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'قطعة جريئة وأنيقة في الوقت نفسه، تضفي على المعصم هيكلاً ولمعاناً وثقة

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1866.00, 1, '18K White Gold', 'Natural Diamonds', '', true, 'vene-1', '2025-12-14 08:31:51.981546', '2026-01-25 08:44:13.055299', true, false, NULL, 'WG_V_by_Vene._video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 2, '');
INSERT INTO public.products VALUES (109, 'Rosa Light Necklace ', 'قلادة روزا لايت', 'Rosa Light is a refined piece that feels light, romantic, effortlessly elegant. It reflects purity, and romance. 

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'روزا لايت قطعة راقية تتميز بالخفة والرومانسية والأناقة العفوية. إنها تعكس النقاء والرومانسية

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1500.00, 1, '18K White Gold', '', 'Ruby Fuchsia, Pink Tourmaline, Amethyst, Moissanite', true, 'rosa-light-necklace', '2026-01-22 19:53:49.395536', '2026-01-25 08:51:56.971601', false, false, NULL, NULL, false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 1, '');
INSERT INTO public.products VALUES (97, 'Forever Two Necklace', 'Forever Two Necklace', 'Forever Two represents unity, balance, and an unbreakable bond.

The design shows two identical forms facing each other, perfectly mirrored. This symmetry is intentional: it symbolizes two souls, two energies, or two people that remain separate yet connected. Neither side dominates. They exist in harmony.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'يُظهر التصميم شكلين متطابقين متقابلين، متطابقين تمامًا. هذا التناظر مقصود: فهو يرمز إلى روحين، أو طاقتين، أو شخصين منفصلين لكنهما متصلان. لا يطغى أي جانب على الآخر، بل يتعايشان بانسجام

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1850.00, 0, '18K Rose Gold', '0.145 cts Natural Diamonds', '', true, 'forever-two-necklace-1', '2026-01-22 10:05:31.224274', '2026-01-26 06:57:44.187022', false, false, NULL, 'RG_Pacman_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 9, 'Enamel');
INSERT INTO public.products VALUES (70, 'V By VENÈ ', 'V By VENÈ', 'A Bold yet sophisticated piece that brings structure, shine, and confidence to the wrist.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'قطعة جريئة وأنيقة في الوقت نفسه، تضفي على المعصم هيكلاً ولمعاناً وثقة

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1866.00, 1, '18K Yellow Gold', 'Natural Diamonds', '', true, 'v-by-vene', '2025-12-16 12:19:20.284319', '2026-01-23 20:08:22.491104', false, false, NULL, 'YG_V_by_Vene_Bracelet_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 16, '');
INSERT INTO public.products VALUES (51, 'Love Harmony', 'تناغم الحب', 'A delicate harmony of hearts and petals, the Love Harmony Ring captures the moment when love blossoms into something timeless.

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.


', 'خاتم تناغم الحب هو تناغم رقيق بين القلوب والبتلات، يلتقط اللحظة التي يزدهر فيها الحب إلى شيء خالد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2450.00, 0, '18K Rose Gold', 'Natural Diamonds', '', true, 'love-harmony-2', '2025-12-15 16:15:11.856062', '2026-01-25 08:25:02.745331', false, false, NULL, 'RG_Love_Harmony_Ring_video_1.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 6, '');
INSERT INTO public.products VALUES (16, 'Vetra', 'فيترا', 'Vetra ring is a bold expression of modern elegance. Crafted in luminous gold, its sculpted geometric pattern creates depth and movement, while the subtle diamond accents add a refined touch of brilliance.
Vetra is designed to those who appreciate artistry, strength, and timeless beauty in a single ring.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'خاتم فيترا تعبيرٌ جريءٌ عن الأناقة العصرية. مصنوعٌ من الذهب المتألق، يُضفي نمطه الهندسي المنحوت عمقًا وحركةً، بينما تُضفي لمسات الألماس الرقيقة لمسةً راقيةً من التألق.

صُمم فيترا لمن يُقدّرون الفن والقوة والجمال الخالد في خاتمٍ واحد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا.', 3005.00, 0, '18K Rose Gold', 'Natural Diamonds', '', true, 'vetra-7', '2025-12-09 12:05:57.288901', '2026-01-22 20:00:17.474602', false, false, NULL, 'RG_Vetra_ring_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 5, '');
INSERT INTO public.products VALUES (92, 'Twin Star', 'سوار النجمة التوأم', 'A circle of strength for the bold at heart. Twin Star celebrates balance and connection creating gentle asymmetry and a modern, timeless feel. it reflects two stars shining together.
Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'دائرة قوة لأصحاب القلوب الجريئة. يحتفي تصميم "النجمة التوأم" بالتوازن والترابط، خالقاً تبايناً رقيقاً وإحساساً عصرياً خالداً. إنه يعكس نجمين يتألقان معاً

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 916.00, 0, '18K White Gold', 'Natural Diamonds', '', true, 'twin-star-1', '2025-12-20 12:36:20.051318', '2026-01-27 11:48:20.558401', false, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 14, '');
INSERT INTO public.products VALUES (64, 'Solara Bloom', 'سولارا بلوم', 'Solara Bloom captures the warmth of a sunrise and the tenderness of a flower opening to the light. A glowing yellow gemstone rests at the top like a small sun, radiating warmth and hope. 

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'سولارا بلوم تُجسّد دفء شروق الشمس ونعومة زهرة تتفتح أمام ضوءها. جوهرة صفراء متوهجة تستقر في الأعلى كشمس صغيرة، تشعّ دفئًا وأملًا

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1331.00, 1, '18K White Gold', 'Natural Diamonds', '1 ct  Lemon yellow Moissanite', true, 'solara-bloom-1', '2025-12-15 20:33:40.81998', '2026-01-22 11:48:32.982616', false, false, NULL, 'WG_flower_yellow_stone_pendant.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 10, '');
INSERT INTO public.products VALUES (10, 'Ocean Light', 'قلادة ضوء المحيط', 'Ocean light is a pendant that captures the calm beauty of the sea. The centerpiece is radiant blue stone that glimmers like sunlight dancing on ocean waves. Beneath it, a delicate floral motif adds softness and grace.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'قلادة "ضوء المحيط" تُجسّد جمال البحر الهادئ. القطعة المركزية عبارة عن حجر أزرق متألق يتلألأ كضوء الشمس على أمواج المحيط. أسفلها، نقشة زهرية رقيقة تُضفي عليها نعومةً وأناقةً.

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا.', 1331.00, 1, '18K White Gold', 'Marquise shape natural diamonds', '1 ct  Sea blue Moissanite', true, 'N-WG-OL-006', '2025-12-08 17:30:43.668804', '2026-01-25 18:55:58.4976', true, false, NULL, 'WG_ocean_light_necklace_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 1, '');
INSERT INTO public.products VALUES (14, 'Vetra', 'فيترا', 'Vetra ring is a bold expression of modern elegance. Crafted in luminous gold, its sculpted geometric pattern creates depth and movement, while the subtle diamond accents add a refined touch of brilliance.
Vetra is designed to those who appreciate artistry, strength, and timeless beauty in a single ring.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'خاتم فيترا تعبيرٌ جريءٌ عن الأناقة العصرية. مصنوعٌ من الذهب المتألق، يُضفي نمطه الهندسي المنحوت عمقًا وحركةً، بينما تُضفي لمسات الألماس الرقيقة لمسةً راقيةً من التألق.

صُمم فيترا لمن يُقدّرون الفن والقوة والجمال الخالد في خاتمٍ واحد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا.', 3005.00, 1, '18K Yellow Gold', '0.27 Ct Natural Diamonds', '', true, 'vetra-8', '2025-12-09 11:52:23.354284', '2026-01-22 20:00:32.923446', false, false, NULL, 'YG_Vetra_ring_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا', 5, '');
INSERT INTO public.products VALUES (125, 'Beirut Domes Bracelet', 'Beirut Domes Bracelet', 'Inspired by Beirut’s iconic domed architecture, this bracelet captures timeless elegance and resilience in a refined, sculptural form.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'مستوحاة من العمارة المقببة الشهيرة لبيروت، يجسد هذا السوار الأناقة الخالدة والصمود في شكل منحوت راقٍ

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2771.00, 0, '18K White Gold', '', '', true, 'beirut-domes-bracelet', '2026-01-27 16:15:40.226101', '2026-01-27 16:15:40.226101', false, false, NULL, 'WG_Beirut_Domes_Bracelet_video.mp4', false, NULL, '', '', 2, 'Blue enamel');
INSERT INTO public.products VALUES (126, 'Beirut Domes Bracelet', 'Beirut Domes Bracelet', 'Inspired by Beirut’s iconic domed architecture, this bracelet captures timeless elegance and resilience in a refined, sculptural form.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'مستوحاة من العمارة المقببة الشهيرة لبيروت، يجسد هذا السوار الأناقة الخالدة والصمود في شكل منحوت راقٍ

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2771.00, 0, '18K White Gold', '', '', true, 'beirut-domes-bracelet-1', '2026-01-27 16:19:26.727624', '2026-01-27 16:19:26.727624', false, false, NULL, 'WG_Beirut_Domes_Bracelet_video.mp4', false, NULL, '', '', 10, 'Blue enamel');
INSERT INTO public.products VALUES (15, 'Vetra', 'فيترا', 'Vetra ring is a bold expression of modern elegance. Crafted in luminous gold, its sculpted geometric pattern creates depth and movement, while the subtle diamond accents add a refined touch of brilliance.
Vetra is designed to those who appreciate artistry, strength, and timeless beauty in a single ring.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'خاتم فيترا تعبيرٌ جريءٌ عن الأناقة العصرية. مصنوعٌ من الذهب المتألق، يُضفي نمطه الهندسي المنحوت عمقًا وحركةً، بينما تُضفي لمسات الألماس الرقيقة لمسةً راقيةً من التألق.

صُمم فيترا لمن يُقدّرون الفن والقوة والجمال الخالد في خاتمٍ واحد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3005.00, 1, '18K White Gold', 'Natural Diamonds', '', true, 'vetra-6', '2025-12-09 12:03:46.532831', '2026-01-23 20:09:44.75789', false, false, NULL, 'WG_Vetra_ring_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 5, '');
INSERT INTO public.products VALUES (8, 'Blush Promise ', 'Blush Promise', 'Elegant, intimate, and timeless, Blush Promise is a vow made visible — a ring for the love you carry softly, yet forever.

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أنيق، حميمي، وخالد، خاتم "بلاش بروميس" هو عهدٌ مُجسّد - خاتمٌ للحب الذي تحملينه برقة، ولكنه أبدي

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، كما أنها تختلف باختلاف حجم الخاتم الذي تطلبينه. لمزيد من المعلومات، يرجى التواصل معنا

', 2527.00, 0, '18K Yellow Gold', '0.312 ct natural round diamonds', 'Ruby', true, 'R-YG-BP-53-005', '2025-12-08 16:53:30.38459', '2026-01-20 05:27:25.413701', false, false, NULL, 'YG_Blush_Promise_Ring_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 3, '');
INSERT INTO public.products VALUES (7, 'Blush Promise', 'Blush Promise', 'Elegant, intimate, and timeless, Blush Promise is a vow made visible — a ring for the love you carry softly, yet forever.

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أنيق، حميمي، وخالد، يعتبر Blush Promise عهدًا واضحًا - خاتم للحب الذي تحمله برفق، ولكن إلى الأبد.

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا.', 2527.00, 0, '18K White Gold', '0.312 ct natural round diamonds', 'Ruby', true, 'R-WG-BP-53-004', '2025-12-08 16:43:27.851893', '2026-01-20 05:28:17.448728', true, false, NULL, 'WG_Blush_Promise_Ring_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا.', 7, '');
INSERT INTO public.products VALUES (29, 'Murmur of the Heart', 'همس القلب', 'Murmur of the Heart ring is the perfect piece to declare your love to someone. expressing your love in a soft, intimate feeling that comes directly from the heart. 

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'خاتم "همس القلب" هو القطعة المثالية للتعبير عن حبك لشخص ما، والتعبير عنه بمشاعر رقيقة وحميمية تنبع مباشرة من القلب

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا.

', 2200.00, 0, '18K Yellow Gold', 'Natural Diamonds', 'Peach Morganite', true, 'R-YG-MH-53-007', '2025-12-13 07:16:15.762662', '2026-01-25 18:52:21.260854', false, false, NULL, 'YG_Peach_Morganite_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 8, '');
INSERT INTO public.products VALUES (6, 'Blush Promise ', 'Blush Promise', 'Elegant, intimate, and timeless, Blush Promise is a vow made visible — a ring for the love you carry softly, yet forever.

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أنيق، حميمي، وخالد، خاتم "بلاش بروميس" هو عهدٌ مُجسّد - خاتمٌ للحب الذي تحملينه برقة، ولكنه أبدي

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، كما أنها تختلف باختلاف حجم الخاتم 
الذي تطلبينه. لمزيد من المعلومات، يرجى التواصل معنا
', 2527.00, 1, '18K Rose Gold', '0.312 ct natural round diamonds', 'Ruby', true, 'blush-promise-1', '2025-12-08 16:38:10.440879', '2026-01-23 20:01:52.395792', true, false, NULL, 'RG_Blush_Promise_Ring_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 6, '');
INSERT INTO public.products VALUES (127, 'Beirut Domes Bracelet', 'Beirut Domes Bracelet', 'Inspired by Beirut’s iconic domed architecture, this bracelet captures timeless elegance and resilience in a refined, sculptural form.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'مستوحاة من العمارة المقببة الشهيرة لبيروت، يجسد هذا السوار الأناقة الخالدة والصمود في شكل منحوت راقٍ

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا


', 2771.00, 0, '18K Yellow Gold', '', '', true, 'beirut-domes-bracelet-2', '2026-01-27 16:23:11.057355', '2026-01-27 16:23:11.057355', false, false, NULL, 'YG_Beirut_Domes_Bracelet_video.mp4', false, NULL, '', '', 16, 'Blue enamel');
INSERT INTO public.products VALUES (33, 'Hearts in Love -Bracelet chain', 'قلوب في الحب', 'A delicate Hearts in Love bracelet captures the essence of love in its purest form. Designed to symbolize love, connection, and timeless beauty. Crafted with love  to be worn for every day or at your special moments.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'سوار "قلوب في الحب" الرقيق يجسد جوهر الحب في أنقى صوره. صُمم ليرمز إلى الحب والترابط والجمال الخالد. صُنع بحب ليُرتدى كل يوم أو في مناسباتك الخاصة

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2500.00, 0, '18K White Gold', 'Natural Diamonds', '', true, 'hearts-in-love-bracelet-chain-2', '2025-12-14 07:42:23.178636', '2026-01-25 08:31:30.733478', false, false, NULL, 'WG_Hearts_Bracelet_Chain_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 2, '');
INSERT INTO public.products VALUES (46, 'Evergreen Crown Ring', 'خاتم تاج البهاء الدائم', 'Evergreen crown symbolize a life that remains vibrant through every season. The design mirrors this timeless resilience: a radiant green sapphire at the side of the design giving it bold and unconventional character, while the surrounding marquise diamonds form a graceful, crown-like halo that captures light from every angle.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'يرمز تاج البهاء الدائم إلى حياةٍ نابضةٍ بالحياة في كل موسم. يعكس التصميم هذه المرونة الخالدة: ياقوتة خضراء متألقة في جانب التصميم تُجسّد الجرأة وتمنحه طابعا غير تقليدي، بينما تُشكّل ماسات الماركيز المحيطة بها هالةً أنيقةً تُشبه التاج، تجذب الضوء من كل زاوية.
يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3125.00, 0, '18K Yellow Gold', 'Natural Diamonds', '1.39 ct Green Sapphire', true, 'evergreen-crown-ring', '2025-12-15 14:07:58.083064', '2026-01-20 05:30:42.654151', false, false, NULL, 'YG_Evergreen_crown_ring.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 8, '');
INSERT INTO public.products VALUES (13, 'Love Harmony', ' تناغم الحب', 'A delicate harmony of hearts and petals, the Love Harmony Ring captures the moment when love blossoms into something timeless.

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'خاتم تناغم الحب هو تناغم رقيق بين القلوب والبتلات، يلتقط اللحظة التي يزدهر فيها الحب إلى شيء خالد.

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا.', 2450.00, 0, '18K Rose Gold', 'Marquise and round shape natural diamonds', '', true, 'R-YG-LH-53-010', '2025-12-09 11:45:34.124119', '2026-01-25 08:19:02.48079', false, false, NULL, 'RG_Love_Harmony_Ring_video_1.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 3, '');
INSERT INTO public.products VALUES (36, 'Hearts in Love Bracelet', 'سوار قلوب في الحب', 'An elegant hearts bracelet made to mark you meaningful moment. This bracelet speaks softly but deeply, perfect for wearing alone or stacked

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'سوار أنيق على شكل قلوب، مصمم لتخليد لحظاتك المميزة. هذا السوار يعبّر عن مشاعر رقيقة وعميقة، وهو مثالي للارتداء بمفرده أو مع أساور أخرى

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا


', 2600.00, 0, '18K White Gold', 'Natural Diamonds', '', true, 'hearts-in-love-bracelet-2', '2025-12-14 07:59:58.515294', '2026-01-25 08:45:08.491372', true, false, NULL, 'WG_Hearts_Bracelet_2_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 2, '');
INSERT INTO public.products VALUES (18, 'Love Harmony', 'تناغم الحب', 'A delicate harmony of hearts and petals, the Love Harmony Ring captures the moment when love blossoms into something timeless.

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'خاتم تناغم الحب هو تناغم رقيق بين القلوب والبتلات، يلتقط اللحظة التي يزدهر فيها الحب إلى شيء خالد.

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا.', 2450.00, 0, '18K White Gold', 'Natural Diamonds', '', true, 'R-WG-LH-53-001', '2025-12-09 12:19:29.760662', '2026-01-25 08:16:17.845804', false, false, NULL, 'WG_Love_Harmony_video_1.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 3, '');
INSERT INTO public.products VALUES (128, 'Beirut Domes Bracelet', 'Beirut Domes Bracelet', 'Inspired by Beirut’s iconic domed architecture, this bracelet captures timeless elegance and resilience in a refined, sculptural form.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'مستوحاة من العمارة المقببة الشهيرة لبيروت، يجسد هذا السوار الأناقة الخالدة والصمود في شكل منحوت راقٍ

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا


', 2771.00, 0, '18K White Gold', '', '', true, 'beirut-domes-bracelet-3', '2026-01-27 16:27:09.89795', '2026-01-27 16:27:09.89795', false, false, NULL, 'WG_Beirut_Domes_Bracelet_video.mp4', false, NULL, '', '', 14, 'Blue enamel');
INSERT INTO public.products VALUES (5, 'Evergreen Crown Ring', 'خاتم تاج البهاء الدائم', 'Evergreen crown symbolize a life that remains vibrant through every season. The design mirrors this timeless resilience: a radiant green sapphire at the side of the design giving it bold and unconventional character, while the surrounding marquise diamonds form a graceful, crown-like halo that captures light from every angle.


Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'يرمز تاج البهاء الدائم إلى حياةٍ نابضةٍ بالحياة في كل موسم. يعكس التصميم هذه المرونة الخالدة: ياقوتة خضراء متألقة في جانب التصميم تُجسّد الجرأة وتمنحه طابعا غير تقليدي، بينما تُشكّل ماسات الماركيز المحيطة بها هالةً أنيقةً تُشبه التاج، تجذب الضوء من كل زاوية.

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا.', 3125.00, 0, '18K Yellow Gold', '0.63 ct Marquise shape natural diamonds', '1.39 ct Green Sapphire', true, 'R-YG-EVRG-002', '2025-12-08 16:15:52.420698', '2026-01-20 05:29:37.618383', true, false, NULL, 'YG_Evergreen_crown_ring.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 3, '');
INSERT INTO public.products VALUES (129, 'Wing of Power Earrings', 'Wing of Power Earrings', 'The wings of power in red enamel embody prestige, energy, and passion. The deep red color gives them a bold presence and luxurious shine, expressing acquired strength and indomitable confidence.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أجنحة القوة بالمينا الحمراء تجسّد الهيبة والطاقة والشغف. اللون الأحمر العميق يمنحها حضورًا جريئًا ولمعانًا فاخرًا، لتعبّر عن قوة مكتسبة وثقة لا تُهزم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2257.00, 0, '18K Rose Gold', 'Natural Diamonds', '', true, 'wing-of-power-earrings', '2026-01-27 16:43:11.223344', '2026-01-27 16:43:11.223344', false, false, NULL, 'RG_Wing_Earrings_video.mp4', false, NULL, '', '', 22, 'Red Enamel');
INSERT INTO public.products VALUES (4, 'Evergreen Crown Ring', 'خاتم تاج البهاء الدائم', 'Evergreen crown symbolize a life that remains vibrant through every season. The design mirrors this timeless resilience: a radiant green sapphire at the side of the design giving it bold and unconventional character, while the surrounding marquise diamonds form a graceful, crown-like halo that captures light from every angle.

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.


', 'يرمز تاج البهاء الدائم إلى حياةٍ نابضةٍ بالحياة في كل موسم. يعكس التصميم هذه المرونة الخالدة: ياقوتة خضراء متألقة في جانب التصميم تُجسّد الجرأة وتمنحه طابعا غير تقليدي، بينما تُشكّل ماسات الماركيز المحيطة بها هالةً أنيقةً تُشبه التاج، تجذب الضوء من كل زاوية.

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا.', 3125.00, 1, '18K White Gold', '0.63 ct Marquise shape natural diamonds- 0.134 ct round natural diamonds', '1.39 ct Green Sapphire', true, 'R-WG-EVRG-001', '2025-12-08 12:59:10.258', '2026-01-23 19:57:31.877888', true, false, NULL, 'WG_Evergreen_crown_ring.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 3, '');
INSERT INTO public.products VALUES (21, 'Love Harmony', 'تناغم الحب', 'A delicate harmony of hearts and petals, the Love Harmony Ring captures the moment when love blossoms into something timeless.

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'خاتم تناغم الحب هو تناغم رقيق بين القلوب والبتلات، يلتقط اللحظة التي يزدهر فيها الحب إلى شيء خالد.

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا.
', 2450.00, 0, '18K Yellow Gold', 'Natural Diamonds', '', true, 'R-YG-LH-53-007', '2025-12-09 13:08:02.516081', '2026-01-25 08:20:01.396094', false, false, NULL, 'YG_Love_Harmony_video_1.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 3, '');
INSERT INTO public.products VALUES (89, 'Silent Waterfall Necklace', 'قلادة الشلال الهادئ', 'The Silent Waterfall necklace captures the calm beauty of flowing water in a refreshed, modern form.
Each line appears to flow into the next, creating a sense of movement while maintaining a clean, minimalist elegance.
 
Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'يجسد عقد "الشلال الهادئ" جمال الماء المتدفق الهادئ في تصميم عصري متجدد

يبدو كل خط وكأنه ينساب بسلاسة إلى الخط الذي يليه، مما يخلق إحساسًا بالحركة مع الحفاظ على أناقة بسيطة وأنيقة

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1523.00, 1, '18K White Gold', 'Natural Diamonds', '', true, 'silent-waterfall-necklace-1', '2025-12-20 10:16:53.557678', '2026-01-20 05:43:26.181074', false, false, NULL, '3_necklaces_video.MP4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 10, '');
INSERT INTO public.products VALUES (130, 'Wing of Power Necklace', 'Wing of Power Necklace', 'The wings of power in red enamel embody prestige, energy, and passion. The deep red color gives them a bold presence and luxurious shine, expressing acquired strength and indomitable confidence.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أجنحة القوة بالمينا الحمراء تجسّد الهيبة والطاقة والشغف. اللون الأحمر العميق يمنحها حضورًا جريئًا ولمعانًا فاخرًا، لتعبّر عن قوة مكتسبة وثقة لا تُهزم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2514.00, 0, '18K White Gold', 'Natural Diamonds', '', true, 'wing-of-power-necklace', '2026-01-28 11:52:41.150434', '2026-01-28 12:23:52.345899', false, false, NULL, 'WG_Wing_Necklace_video.mp4', false, NULL, '', '', 1, 'Red Enamel');
INSERT INTO public.products VALUES (54, 'Majesty in Violet', 'ماجستي ان فيوليت', 'Shine like a queen and stand out from the crowd

The Majesty in Violet ring showcases a vivid violet spinel surrounded by natural diamonds and elegant marquise cuts arranged in a crown-inspired design.

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'يتميز خاتم ”ماجستي ان فيوليت“ بحجر سبينل بنفسجي نابض بالحياة، محاط بالماس طبيعي وأحجار ألماس ماركيز  في تصميم  مستوحى من التاج

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3594.00, 1, '18K White Gold', '0.51 ct. Natural round diamonds and 0.48 ct. marquise shaped diamonds', 'Purple Spinel ', true, 'majesty-in-violet', '2025-12-15 17:36:57.002864', '2026-01-23 20:00:41.880009', false, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 7, '');
INSERT INTO public.products VALUES (95, 'Infinite Love Necklace', 'قلادة الحب الأبدي', 'Two flowing, asymmetrical curves intervene gracefully to form an abstract heart, symbolizing the connection of infinite love of two souls.

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'يتداخل منحنيان متدفقان وغير متماثلين برشاقة ليشكلا قلبًا مجردًا، يرمز إلى اتصال الحب اللامتناهي بين روحين

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1276.00, 1, '18K White Gold', 'Natural Diamonds', '', true, 'infinite-love-necklace-1', '2026-01-20 05:51:18.346902', '2026-01-20 05:51:18.346902', false, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 10, 'Pink Stone');
INSERT INTO public.products VALUES (131, 'Wing of Power Necklace', 'Wing of Power Necklace', 'The wings of power in red enamel embody prestige, energy, and passion. The deep red color gives them a bold presence and luxurious shine, expressing acquired strength and indomitable confidence.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أجنحة القوة بالمينا الحمراء تجسّد الهيبة والطاقة والشغف. اللون الأحمر العميق يمنحها حضورًا جريئًا ولمعانًا فاخرًا، لتعبّر عن قوة مكتسبة وثقة لا تُهزم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2514.00, 0, '18K White Gold', 'Natural Diamonds', '', true, 'wing-of-power-necklace-1', '2026-01-28 12:06:18.146052', '2026-01-28 12:24:14.533868', false, false, NULL, 'WG_Wing_Necklace_video.mp4', false, NULL, '', '', 10, 'Red Enamel');
INSERT INTO public.products VALUES (28, 'Candy Bracelet', 'سوار كاندي', 'Adorn your hand with Candy Bracelet. Each candy reflects light with a smooth, sculpted finish, creating a joyful rhythm that feels both elegant and modern. Perfect for stacking or wearing alone as a subtle statement of charm and refinement.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.


', 'زيّني معصمكِ بسوار كاندي. تعكس كل قطعة حلوى الضوء بلمسة نهائية ناعمة ومنحوتة، لتخلق إيقاعًا بهيجًا يجمع بين الأناقة والعصرية. مثالي للارتداء مع أساور أخرى أو بمفرده كإضافة رقيقة من السحر والرقي

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 2145.00, 0, '18K White Gold', 'Natural Diamonds', '', true, 'candy-bracelet', '2025-12-12 19:22:50.53577', '2026-01-25 08:32:28.366833', true, false, NULL, 'WG_Candy_Bracelet_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 2, '');
INSERT INTO public.products VALUES (67, 'Candy Bracelet', 'سوار كاندي', 'Adorn your hand with Candy Bracelet. Each candy reflects light with a smooth, sculpted finish, creating a joyful rhythm that feels both elegant and modern. Perfect for stacking or wearing alone as a subtle statement of charm and refinement.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'زيّني معصمكِ بسوار كاندي. تعكس كل قطعة حلوى الضوء بلمسة نهائية ناعمة ومنحوتة، لتخلق إيقاعًا بهيجًا يجمع بين الأناقة والعصرية. مثالي للارتداء مع أساور أخرى أو بمفرده كإضافة رقيقة من السحر والرقي

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2145.00, 0, '18K Yellow Gold', 'Natural Diamonds', '', true, 'candy-bracelet-3', '2025-12-16 11:57:04.23555', '2026-01-25 08:35:58.507359', false, false, NULL, 'YG_Candy_Bracelet_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 16, '');
INSERT INTO public.products VALUES (133, 'Wings of Power Necklace', 'Wings of Power Necklace', 'The wings of power in red enamel embody prestige, energy, and passion. The deep red color gives them a bold presence and luxurious shine, expressing acquired strength and indomitable confidence.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أجنحة القوة بالمينا الحمراء تجسّد الهيبة والطاقة والشغف. اللون الأحمر العميق يمنحها حضورًا جريئًا ولمعانًا فاخرًا، لتعبّر عن قوة مكتسبة وثقة لا تُهزم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3543.00, 0, '18K Yellow Gold', 'Natural Diamonds', '', true, 'wings-of-power-necklace', '2026-01-28 12:12:27.518569', '2026-01-28 12:23:13.920227', false, false, NULL, 'YG_Wing_Necklace_Double_video.mp4', false, NULL, '', '', 1, 'Red Enamel');
INSERT INTO public.products VALUES (132, 'Wing of Power Necklace', 'Wing of Power Necklace', 'The wings of power in red enamel embody prestige, energy, and passion. The deep red color gives them a bold presence and luxurious shine, expressing acquired strength and indomitable confidence.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أجنحة القوة بالمينا الحمراء تجسّد الهيبة والطاقة والشغف. اللون الأحمر العميق يمنحها حضورًا جريئًا ولمعانًا فاخرًا، لتعبّر عن قوة مكتسبة وثقة لا تُهزم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2514.00, 0, '18K Yellow Gold', 'Natural Diamonds', '', true, 'wing-of-power-necklace-2', '2026-01-28 12:08:39.066357', '2026-01-28 12:24:42.965773', false, false, NULL, 'YG_Wing_Necklace_video.mp4', false, NULL, '', '', 11, 'Red Enamel');
INSERT INTO public.products VALUES (27, 'Candy Bracelet', 'اسوارة كاندي', 'Adorn your hand with Candy Bracelet. Each candy reflects light with a smooth, sculpted finish, creating a joyful rhythm that feels both elegant and modern. Perfect for stacking or wearing alone as a subtle statement of charm and refinement.

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'زيّني معصمكِ بسوار كاندي. تعكس كل قطعة حلوى الضوء بلمسة نهائية ناعمة ومنحوتة، لتخلق إيقاعًا بهيجًا يجمع بين الأناقة والعصرية. مثالي للارتداء مع أساور أخرى أو بمفرده كإضافة رقيقة من السحر والرقي

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا', 2145.00, 0, '18K Yellow Gold', 'Natural Diamonds', '', true, 'candy-bracelet-2', '2025-12-12 18:45:46.390018', '2026-01-25 08:34:12.445558', false, false, NULL, 'YG_Candy_Bracelet_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 2, '');
INSERT INTO public.products VALUES (68, 'Hearts in Love -Bracelet chain', 'قلوب في الحب', 'A delicate Hearts in Love bracelet captures the essence of love in its purest form. Designed to symbolize love, connection, and timeless beauty. Crafted with love  to be worn for every day or at your special moments.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'سوار "قلوب في الحب" الرقيق يجسد جوهر الحب في أنقى صوره. صُمم ليرمز إلى الحب والترابط والجمال الخالد. صُنع بحب ليُرتدى كل يوم أو في مناسباتك الخاصة

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2500.00, 0, '18K Yellow Gold', 'Natural Diamonds', '', true, 'hearts-in-love-bracelet-chain-3', '2025-12-16 12:01:10.731682', '2026-01-25 08:36:24.344129', false, false, NULL, 'YG_Hearts_Breaclet_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 16, '');
INSERT INTO public.products VALUES (93, 'Vetra Ring', 'فيترا', 'Vetra ring is a bold expression of modern elegance. Crafted in luminous gold, its sculpted geometric pattern creates depth and movement, while the subtle diamond accents add a refined touch of brilliance.
Vetra is designed to those who appreciate artistry, strength, and timeless beauty in a single ring.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'خاتم فيترا تعبيرٌ جريءٌ عن الأناقة العصرية. مصنوعٌ من الذهب المتألق، يُضفي نمطه الهندسي المنحوت عمقًا وحركةً، بينما تُضفي لمسات الألماس الرقيقة لمسةً راقيةً من التألق

صُمم فيترا لمن يُقدّرون الفن والقوة والجمال الخالد في خاتمٍ واحد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3005.00, 0, '18K Rose Gold', '0.27 CT Diamonds', '', true, 'vetra-ring', '2026-01-13 05:45:14.020269', '2026-01-22 19:59:58.970788', false, false, NULL, 'RG_Vetra_ring_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 17, '');
INSERT INTO public.products VALUES (69, 'Hearts in Love Bracelet', 'سوار قلوب في الحب', 'An elegant hearts bracelet made to mark you meaningful moment. This bracelet speaks softly but deeply, perfect for wearing alone or stacked

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'سوار أنيق على شكل قلوب، مصمم لتخليد لحظاتك المميزة. هذا السوار يعبّر عن مشاعر رقيقة وعميقة، وهو مثالي للارتداء بمفرده أو مع أساور أخرى

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2600.00, 0, '18K Yellow Gold', 'Natural Diamonds', '', true, 'hearts-in-love-bracelet-3', '2025-12-16 12:09:07.137442', '2026-01-25 08:36:46.199151', false, false, NULL, 'YG_Hearts_Bracelet_2_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 16, '');
INSERT INTO public.products VALUES (102, 'Flora Essence Earrings', 'جوهر الزهرة', 'Flora Essence is the spirit of a flower feminine without being fragile, elegant without being loud, and luxurious without being heavy.
A timeless piece that carries beauty, calm, and quiet strength, symbolizing growth, purity, and inner radiance.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'جوهر الزهرة هو روح أنثوية دون أن تكون هشة، أنيقة دون أن تكون صاخبة، وفاخرة دون أن تكون ثقيلة

قطعة خالدة تحمل في طياتها الجمال والهدوء والقوة الكامنة، وترمز إلى النمو والنقاء والإشراق الداخلي

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2677.00, 1, '18K White Gold', '0.5 cts natural diamonds', '', true, 'flora-essence-earrings', '2026-01-22 16:15:54.30843', '2026-01-22 16:15:54.30843', false, false, NULL, NULL, true, NULL, '
All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 4, '');
INSERT INTO public.products VALUES (101, 'Flora Essence Necklace', 'جوهر الزهرة', 'Flora Essence is the spirit of a flower feminine without being fragile, elegant without being loud, and luxurious without being heavy.
A timeless piece that carries beauty, calm, and quiet strength, symbolizing growth, purity, and inner radiance.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'جوهر الزهرة هو روح أنثوية دون أن تكون هشة، أنيقة دون أن تكون صاخبة، وفاخرة دون أن تكون ثقيلة

قطعة خالدة تحمل في طياتها الجمال والهدوء والقوة الكامنة، وترمز إلى النمو والنقاء والإشراق الداخلي

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1900.00, 1, '18K White Gold', 'Natural Diamonds', '', true, 'flora-essence-necklace-1', '2026-01-22 15:21:14.669306', '2026-01-22 16:17:45.3853', false, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 10, '');
INSERT INTO public.products VALUES (43, 'Vetra Bracelet', 'سوار فيترا', 'Vetra bracelet is a bold expression of modern elegance. Crafted in luminous gold, its sculpted geometric pattern creates depth and movement, while the subtle diamond accents add a refined touch of brilliance.
Vetra is designed to those who appreciate artistry, strength, and timeless beauty.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'سوار فيترا تعبيرٌ جريءٌ عن الأناقة العصرية. مصنوعٌ من الذهب المتألق، يُضفي نمطه الهندسي المنحوت عمقًا وحركةً، بينما تُضفي لمسات الألماس الرقيقة لمسةً راقيةً من التألق.

صُمم فيترا لمن يُقدّرون الفن والقوة والجمال الخالد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 7601.00, 0, '18K White Gold', 'Natural Diamonds', '', true, 'vetra-bracelet-2', '2025-12-15 13:15:54.817424', '2026-01-25 08:46:08.900083', false, false, NULL, 'WG_Vetra_Bracelet_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 2, '');
INSERT INTO public.products VALUES (134, 'Wings of Power Necklace', 'Wings of Power Necklace', 'The wings of power in red enamel embody prestige, energy, and passion. The deep red color gives them a bold presence and luxurious shine, expressing acquired strength and indomitable confidence.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أجنحة القوة بالمينا الحمراء تجسّد الهيبة والطاقة والشغف. اللون الأحمر العميق يمنحها حضورًا جريئًا ولمعانًا فاخرًا، لتعبّر عن قوة مكتسبة وثقة لا تُهزم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3543.00, 0, '18K Yellow Gold', 'Natural Diamonds', '', true, 'wings-of-power-necklace-1', '2026-01-28 12:28:26.336115', '2026-01-28 12:28:26.336115', false, false, NULL, 'YG_Wing_Necklace_Double_video.mp4', false, NULL, '', '', 11, 'Red Enamel');
INSERT INTO public.products VALUES (71, 'Hearts in Love -Bracelet chain', 'قلوب في الحب', 'A delicate Hearts in Love bracelet captures the essence of love in its purest form. Designed to symbolize love, connection, and timeless beauty. Crafted with love  to be worn for every day or at your special moments.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'سوار "قلوب في الحب" الرقيق يجسد جوهر الحب في أنقى صوره. صُمم ليرمز إلى الحب والترابط والجمال الخالد. صُنع بحب ليُرتدى كل يوم أو في مناسباتك الخاصة

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2500.00, 0, '18K Rose Gold', 'Natural Diamonds', '', true, 'hearts-in-love-bracelet-chain-4', '2025-12-16 12:29:33.540226', '2026-01-25 08:37:19.247447', false, false, NULL, 'RG_Hearts_Bracelet_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 13, '');
INSERT INTO public.products VALUES (135, 'Wings of Power Necklace', 'Wings of Power Necklace', 'The wings of power in red enamel embody prestige, energy, and passion. The deep red color gives them a bold presence and luxurious shine, expressing acquired strength and indomitable confidence.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أجنحة القوة بالمينا الحمراء تجسّد الهيبة والطاقة والشغف. اللون الأحمر العميق يمنحها حضورًا جريئًا ولمعانًا فاخرًا، لتعبّر عن قوة مكتسبة وثقة لا تُهزم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3543.00, 0, '18K White Gold', 'Natural Diamonds', '', true, 'wings-of-power-necklace-2', '2026-01-28 12:30:43.707039', '2026-01-28 12:30:43.707039', false, false, NULL, 'WG_Wing_Necklace_Double_video.mp4', false, NULL, '', '', 10, 'Red Enamel');
INSERT INTO public.products VALUES (136, 'Wings of Power Ring', 'Wings of Power Ring', 'The wings of power in red enamel embody prestige, energy, and passion. The deep red color gives them a bold presence and luxurious shine, expressing acquired strength and indomitable confidence.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أجنحة القوة بالمينا الحمراء تجسّد الهيبة والطاقة والشغف. اللون الأحمر العميق يمنحها حضورًا جريئًا ولمعانًا فاخرًا، لتعبّر عن قوة مكتسبة وثقة لا تُهزم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3043.00, 0, '18K White Gold', 'Natural Diamonds', '', true, 'wings-of-power-ring', '2026-01-28 12:35:16.012743', '2026-01-28 12:35:16.012743', false, false, NULL, 'WG_Wing_ring_video.mp4', false, NULL, '', '', 3, 'Red Enamel');
INSERT INTO public.products VALUES (76, 'Hearts in Love -Bracelet chain', 'قلوب في الحب', 'A delicate Hearts in Love bracelet captures the essence of love in its purest form. Designed to symbolize love, connection, and timeless beauty. Crafted with love  to be worn for every day or at your special moments.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'سوار "قلوب في الحب" الرقيق يجسد جوهر الحب في أنقى صوره. صُمم ليرمز إلى الحب والترابط والجمال الخالد. صُنع بحب ليُرتدى كل يوم أو في مناسباتك الخاصة

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2500.00, 0, '18K White Gold', 'Natural Diamonds', '', true, 'hearts-in-love-bracelet-chain-5', '2025-12-16 18:41:22.988486', '2026-01-25 08:40:13.508418', false, false, NULL, 'WG_Hearts_Bracelet_Chain_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 14, '');
INSERT INTO public.products VALUES (78, 'Vetra Bracelet', 'سوار فيترا', 'Vetra bracelet is a bold expression of modern elegance. Crafted in luminous gold, its sculpted geometric pattern creates depth and movement, while the subtle diamond accents add a refined touch of brilliance.
Vetra is designed to those who appreciate artistry, strength, and timeless beauty.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'سوار فيترا تعبيرٌ جريءٌ عن الأناقة العصرية. مصنوعٌ من الذهب المتألق، يُضفي نمطه الهندسي المنحوت عمقًا وحركةً، بينما تُضفي لمسات الألماس الرقيقة لمسةً راقيةً من التألق

صُمم فيترا لمن يُقدّرون الفن والقوة والجمال الخالد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 7601.00, 0, '18K White Gold', 'Natural Diamonds', '', true, 'vetra-bracelet-4', '2025-12-16 18:46:56.236797', '2026-01-25 08:40:33.845449', false, false, NULL, 'WG_Vetra_Bracelet_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 14, '');
INSERT INTO public.products VALUES (137, 'Wings of Power Necklace', 'Wings of Power Necklace', 'The wings of power in red enamel embody prestige, energy, and passion. The deep red color gives them a bold presence and luxurious shine, expressing acquired strength and indomitable confidence.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أجنحة القوة بالمينا الحمراء تجسّد الهيبة والطاقة والشغف. اللون الأحمر العميق يمنحها حضورًا جريئًا ولمعانًا فاخرًا، لتعبّر عن قوة مكتسبة وثقة لا تُهزم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3543.00, 0, '18K Rose Gold', 'Natural Diamonds', '', true, 'wings-of-power-necklace-3', '2026-01-28 12:37:44.315912', '2026-01-28 12:37:44.315912', false, false, NULL, 'RG_Wing_Necklace_Double_video.mp4', false, NULL, '', '', 9, 'Red Enamel');
INSERT INTO public.products VALUES (114, 'Orbit Necklace', 'قلادة المدار', 'A sleek, modern necklace featuring a pendant that rotates smoothly around its center, inspired by the motion of celestial bodies.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'قلادة أنيقة وعصرية تتميز بقلادة تدور بسلاسة حول مركزها، مستوحاة من حركة الأجرام السماوية

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 2443.00, 1, '18K White Gold', '', 'Dark Aquamarine, Citrine, white Moissanite', true, 'orbit-necklace', '2026-01-23 17:10:53.644588', '2026-01-23 17:10:53.644588', false, false, NULL, NULL, false, NULL, '', '', 1, '');
INSERT INTO public.products VALUES (115, 'Orbit Necklace', 'قلادة المدار', 'A sleek, modern necklace featuring a pendant that rotates smoothly around its center, inspired by the motion of celestial bodies.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'قلادة أنيقة وعصرية تتميز بقلادة تدور بسلاسة حول مركزها، مستوحاة من حركة الأجرام السماوية

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2443.00, 1, '18K White Gold', '', 'Dark Aquamarine, Citrine, white Moissanite', true, 'orbit-necklace-1', '2026-01-23 17:13:55.062545', '2026-01-23 17:13:55.062545', false, false, NULL, NULL, false, NULL, '', '', 10, '');
INSERT INTO public.products VALUES (80, 'Vetra Bracelet', 'سوار فيترا', 'Vetra bracelet is a bold expression of modern elegance. Crafted in luminous gold, its sculpted geometric pattern creates depth and movement, while the subtle diamond accents add a refined touch of brilliance.
Vetra is designed to those who appreciate artistry, strength, and timeless beauty.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'سوار فيترا تعبيرٌ جريءٌ عن الأناقة العصرية. مصنوعٌ من الذهب المتألق، يُضفي نمطه الهندسي المنحوت عمقًا وحركةً، بينما تُضفي لمسات الألماس الرقيقة لمسةً راقيةً من التألق

صُمم فيترا لمن يُقدّرون الفن والقوة والجمال الخالد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 7601.00, 0, '18K Rose Gold', 'Natural Diamonds', '', true, 'vetra-bracelet-5', '2025-12-17 08:29:39.520288', '2026-01-25 08:46:28.006554', false, false, NULL, 'RG_Vetra_Bracelet._video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 2, '');
INSERT INTO public.products VALUES (79, 'Candy Bracelet', 'سوار كاندي', 'Adorn your hand with Candy Bracelet. Each candy reflects light with a smooth, sculpted finish, creating a joyful rhythm that feels both elegant and modern. Perfect for stacking or wearing alone as a subtle statement of charm and refinement.

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'زيّني معصمكِ بسوار كاندي. تعكس كل قطعة حلوى الضوء بلمسة نهائية ناعمة ومنحوتة، لتخلق إيقاعًا بهيجًا يجمع بين 
الأناقة والعصرية. مثالي للارتداء مع أساور أخرى أو بمفرده كإضافة رقيقة من السحر والرقي

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، كما أنها تختلف باختلاف حجم الخاتم الذي تطلبينه
  لمزيد من المعلومات، يرجى التواصل معنا
', 2145.00, 0, '18K White Gold', 'Natural Diamonds', '', true, 'candy-bracelet-5', '2025-12-16 18:49:54.466666', '2026-01-25 08:41:01.700505', false, false, NULL, 'WG_Candy_Bracelet_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 14, '');
INSERT INTO public.products VALUES (96, 'Forever Two Necklace', 'Forever Two Necklace', 'Forever Two represents unity, balance, and an unbreakable bond.

The design shows two identical forms facing each other, perfectly mirrored. This symmetry is intentional: it symbolizes two souls, two energies, or two people that remain separate yet connected. Neither side dominates. They exist in harmony.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'يُظهر التصميم شكلين متطابقين متقابلين، متطابقين تمامًا. هذا التناظر مقصود: فهو يرمز إلى روحين، أو طاقتين، أو شخصين منفصلين لكنهما متصلان. لا يطغى أي جانب على الآخر، بل يتعايشان بانسجام

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1850.00, 0, '18K Yellow Gold', '0.145 cts Natural Diamonds', '', true, 'forever-two-necklace', '2026-01-21 06:46:42.06497', '2026-01-26 06:58:28.557216', false, false, NULL, 'YG_Pacman_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 1, 'Enamel');
INSERT INTO public.products VALUES (138, 'Wing of Power Necklace', 'Wing of Power Necklace', 'The wings of power in red enamel embody prestige, energy, and passion. The deep red color gives them a bold presence and luxurious shine, expressing acquired strength and indomitable confidence.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أجنحة القوة بالمينا الحمراء تجسّد الهيبة والطاقة والشغف. اللون الأحمر العميق يمنحها حضورًا جريئًا ولمعانًا فاخرًا، لتعبّر عن قوة مكتسبة وثقة لا تُهزم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2514.00, 0, '18K Rose Gold', 'Natural Diamonds', '', true, 'wing-of-power-necklace-3', '2026-01-28 12:39:34.078102', '2026-01-28 12:39:34.078102', false, false, NULL, 'RG_Wing_necklace_video.mp4', false, NULL, '', '', 9, 'Red Enamel');
INSERT INTO public.products VALUES (98, 'Forever Two Necklace', 'Forever Two Necklace', 'Forever Two represents unity, balance, and an unbreakable bond.

The design shows two identical forms facing each other, perfectly mirrored. This symmetry is intentional: it symbolizes two souls, two energies, or two people that remain separate yet connected. Neither side dominates. They exist in harmony.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'يُظهر التصميم شكلين متطابقين متقابلين، متطابقين تمامًا. هذا التناظر مقصود: فهو يرمز إلى روحين، أو طاقتين، أو شخصين منفصلين لكنهما متصلان. لا يطغى أي جانب على الآخر، بل يتعايشان بانسجام

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 1850.00, 0, '18k Yellow gold', '0.145 cts Natural Diamonds', '', true, 'forever-two-necklace-2', '2026-01-22 10:09:24.461196', '2026-01-26 06:58:48.032559', false, false, NULL, 'YG_Pacman_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 11, 'Enamel');
INSERT INTO public.products VALUES (116, 'Beirut Domes Earrings', 'Beirut Domes Earrings', '
Inspired by Beirut’s iconic domed architecture, this earrings captures timeless elegance and resilience in a refined, sculptural form.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'مستوحاة من العمارة المقببة الشهيرة لبيروت، يجسد هذا الحلق الأناقة الخالدة والصمود في شكل منحوت راقٍ

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3028.00, 0, '18K Yellow Gold', '', '', true, 'beirut-domes-earrings', '2026-01-23 18:51:52.352314', '2026-01-27 15:45:00.009595', false, false, NULL, NULL, false, NULL, '', '', 23, 'Enamel');
INSERT INTO public.products VALUES (84, 'Vera V Pendant', 'Vera V Pendant', 'A bold yet elegant necklace, crafted in a geometric design for those who likes to shine different in every moment.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'قلادة جريئة وأنيقة في آن واحد، مصممة بتصميم هندسي لمن يرغب في التألق بشكل مختلف في كل لحظة

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1501.00, 1, '18K Yellow Gold', 'Natural Diamonds', '', true, 'vera-v-pendant', '2025-12-20 09:00:15.023328', '2026-01-20 05:44:16.379081', false, false, NULL, '3_necklaces_video.MP4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 1, '');
INSERT INTO public.products VALUES (139, 'Wings of Power Ring', 'Wings of Power Ring', 'The wings of power in red enamel embody prestige, energy, and passion. The deep red color gives them a bold presence and luxurious shine, expressing acquired strength and indomitable confidence.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أجنحة القوة بالمينا الحمراء تجسّد الهيبة والطاقة والشغف. اللون الأحمر العميق يمنحها حضورًا جريئًا ولمعانًا فاخرًا، لتعبّر عن قوة مكتسبة وثقة لا تُهزم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 3043.00, 0, '18K White Gold', 'Natural Diamonds', '', true, 'wings-of-power-ring-1', '2026-01-28 12:43:04.407976', '2026-01-28 12:43:04.407976', false, false, NULL, 'WG_Wing_ring_video.mp4', false, NULL, '', '', 7, 'Red Enamel');
INSERT INTO public.products VALUES (140, 'Wings of Power Ring', 'Wings of Power Ring', 'The wings of power in red enamel embody prestige, energy, and passion. The deep red color gives them a bold presence and luxurious shine, expressing acquired strength and indomitable confidence.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أجنحة القوة بالمينا الحمراء تجسّد الهيبة والطاقة والشغف. اللون الأحمر العميق يمنحها حضورًا جريئًا ولمعانًا فاخرًا، لتعبّر عن قوة مكتسبة وثقة لا تُهزم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 3043.00, 0, '18K Yellow Gold', 'Natural Diamonds', '', true, 'wings-of-power-ring-2', '2026-01-28 12:45:58.275059', '2026-01-28 12:45:58.275059', false, false, NULL, 'YG_Wing_ring_video.mp4', false, NULL, '', '', 8, 'Red Enamel');
INSERT INTO public.products VALUES (141, 'Wings of Power Ring', 'Wings of Power Ring', 'The wings of power in red enamel embody prestige, energy, and passion. The deep red color gives them a bold presence and luxurious shine, expressing acquired strength and indomitable confidence.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أجنحة القوة بالمينا الحمراء تجسّد الهيبة والطاقة والشغف. اللون الأحمر العميق يمنحها حضورًا جريئًا ولمعانًا فاخرًا، لتعبّر عن قوة مكتسبة وثقة لا تُهزم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 3043.00, 0, '18K Rose Gold', 'Natural Diamonds', '', true, 'wings-of-power-ring-3', '2026-01-28 12:47:42.399274', '2026-01-28 12:47:42.399274', false, false, NULL, 'RG_Wing_Ring_video.mp4', false, NULL, '', '', 6, 'Red Enamel');
INSERT INTO public.products VALUES (99, 'Forever Two Necklace', 'Forever Two Necklace', '
Forever Two represents unity, balance, and an unbreakable bond.

The design shows two identical forms facing each other, perfectly mirrored. This symmetry is intentional: it symbolizes two souls, two energies, or two people that remain separate yet connected. Neither side dominates. They exist in harmony.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'يُظهر التصميم شكلين متطابقين متقابلين، متطابقين تمامًا. هذا التناظر مقصود: فهو يرمز إلى روحين، أو طاقتين، أو شخصين منفصلين لكنهما متصلان. لا يطغى أي جانب على الآخر، بل يتعايشان بانسجام

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1850.00, 0, '18K White Gold', '0.145 cts Natural Diamonds', '', true, 'forever-two-necklace-3', '2026-01-22 10:14:35.728074', '2026-01-26 06:59:08.967572', false, false, NULL, 'WG_pacman_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 10, 'Enamel');
INSERT INTO public.products VALUES (142, 'Wings of Power Ring', 'Wings of Power Ring', 'The wings of power in red enamel embody prestige, energy, and passion. The deep red color gives them a bold presence and luxurious shine, expressing acquired strength and indomitable confidence.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أجنحة القوة بالمينا الحمراء تجسّد الهيبة والطاقة والشغف. اللون الأحمر العميق يمنحها حضورًا جريئًا ولمعانًا فاخرًا، لتعبّر عن قوة مكتسبة وثقة لا تُهزم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 3043.00, 0, '', '', '', true, 'wings-of-power-ring-4', '2026-01-28 12:50:29.283564', '2026-01-28 12:50:29.283564', false, false, NULL, 'RG_Wing_Ring_video.mp4', false, NULL, '', '', 3, '');
INSERT INTO public.products VALUES (22, 'Golden Horizon', 'الأفق الذهبي', 'This necklace features a minimalist gold frame that holds gentle, wave-like line, creating a serene and fluid silhouette. its soft curves are paired with delicate diamond accents. This piece is perfect for someone who appreciates simplicity with a touch of timeless elegance.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'تتميز هذه القلادة بإطار ذهبي بسيط يحمل خطاً متموج، مما يخلق مظهرًا هادئًا وانسيابيًا. تتناغم منحنياتها الناعمة مع لمسات ألماس رقيقة. هذه القطعة مثالية لمن يقدر البساطة بلمسة من الأناقة الخالدة

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا', 1618.00, 1, '18K Yellow Gold', 'Natural Diamonds', '', true, 'golden-horizon-1', '2025-12-09 13:20:48.030498', '2026-01-20 05:45:12.802049', false, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 1, '');
INSERT INTO public.products VALUES (65, 'Golden Horizon', 'الأفق الذهبي', 'This necklace features a minimalist gold frame that holds gentle, wave-like line, creating a serene and fluid silhouette. its soft curves are paired with delicate diamond accents. This piece is perfect for someone who appreciates simplicity with a touch of timeless elegance.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'تتميز هذه القلادة بإطار ذهبي بسيط يحمل خطاً متموج، مما يخلق مظهرًا هادئًا وانسيابيًا. تتناغم منحنياتها الناعمة مع لمسات ألماس رقيقة. هذه القطعة مثالية لمن يقدر البساطة بلمسة من الأناقة الخالدة

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1618.00, 1, '18K Yellow Gold', 'Natural Diamonds', '', true, 'golden-horizon', '2025-12-15 20:44:54.751914', '2026-01-20 05:45:26.222505', false, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 11, '');
INSERT INTO public.products VALUES (143, 'Wing of Power Earrings', 'Wing of Power Earrings', 'The wings of power in red enamel embody prestige, energy, and passion. The deep red color gives them a bold presence and luxurious shine, expressing acquired strength and indomitable confidence.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أجنحة القوة بالمينا الحمراء تجسّد الهيبة والطاقة والشغف. اللون الأحمر العميق يمنحها حضورًا جريئًا ولمعانًا فاخرًا، لتعبّر عن قوة مكتسبة وثقة لا تُهزم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2257.00, 0, '18K White Gold', 'Natural Diamonds', '', true, 'wing-of-power-earrings-1', '2026-01-29 06:22:24.631191', '2026-01-29 06:22:24.631191', false, false, NULL, 'WG_Wing_Earrings_video.mp4', false, NULL, '', '', 4, 'Red Enamel');
INSERT INTO public.products VALUES (144, 'Wing of Power Earrings', 'Wing of Power Earrings', 'The wings of power in red enamel embody prestige, energy, and passion. The deep red color gives them a bold presence and luxurious shine, expressing acquired strength and indomitable confidence.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أجنحة القوة بالمينا الحمراء تجسّد الهيبة والطاقة والشغف. اللون الأحمر العميق يمنحها حضورًا جريئًا ولمعانًا فاخرًا، لتعبّر عن قوة مكتسبة وثقة لا تُهزم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2257.00, 0, '18K Yellow Gold', 'Natural Diamonds', '', true, 'wing-of-power-earrings-2', '2026-01-29 06:25:03.414146', '2026-01-29 06:25:03.414146', false, false, NULL, 'YG_Wing_Earrings_video.mp4', false, NULL, '', '', 23, 'Red Enamel');
INSERT INTO public.products VALUES (3, 'Moon Star Necklace', 'قلادة نجمة القمر', 'Carry the universe close to your heart!
The Moon Star necklace features a golden crescent and star brought together in a striking celestial design. Diamonds adorn the curves and points, adding brilliance and depth to the sculpted forms.

* Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.', 'احتضني الكون في قلبك
 تتميز قلادة نجمة القمر بهلال وبدر ونجمة متجاورين في تصميم سماوي خلاب. تزين أحجار الألماس المنحنيات، مما يضفي بريقاً وعمقاً على التصميم 

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا', 2297.00, 1, '18K Yellow Gold', 'Natural Diamonds', '', true, 'moon-star-necklace', '2025-12-08 05:12:39.905892', '2026-01-20 05:36:30.948941', true, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 1, '');
INSERT INTO public.products VALUES (105, 'Solar Flora Earrings', 'حلق سولار فلورا', 'Solar Flora blends golden light and floral elegance, where two radiant blooms shine with warmth, balance, and timeless beauty.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'يمزج سولار فلورا بين الضوء الذهبي والأناقة الزهرية، حيث تتألق زهرتان مشرقتان بالدفء والتوازن والجمال الخالد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 5630.00, 1, '18K White Gold', 'Natural Round Diamonds and Marquise', 'Golden Moissanite', true, 'solar-flora-earrings', '2026-01-22 19:18:51.352044', '2026-01-23 19:52:23.821213', false, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 4, '');
INSERT INTO public.products VALUES (107, 'Solar Flora Ring', 'خاتم سولار فلورا', 'Solar Flora blends golden light and floral elegance, where two radiant blooms shine with warmth, balance, and timeless beauty.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'يمزج سولار فلورا بين الضوء الذهبي والأناقة الزهرية، حيث تتألق زهرتان مشرقتان بالدفء والتوازن والجمال الخالد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3702.00, 1, '18K White Gold', 'Natural Round Diamonds and Marquise', 'Golden Moissanite', true, 'solar-flora-ring-1', '2026-01-22 19:29:45.827534', '2026-01-23 20:01:14.995909', false, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 7, '');
INSERT INTO public.products VALUES (118, 'Beirut Domes Necklace', 'Beirut Domes Necklace', 'Inspired by Beirut’s iconic domed architecture, this necklace captures timeless elegance and resilience in a refined, sculptural form.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'مستوحاة من العمارة المقببة الشهيرة لبيروت، تجسد هذه القلادة الأناقة الخالدة والصمود في شكل منحوت راقٍ

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3543.00, 0, '18K White Gold', '', '', true, 'beirut-domes-necklace', '2026-01-23 19:08:34.110924', '2026-01-27 15:38:19.844213', false, false, NULL, 'WG_Beirut_Domes_necklace_video.mp4', false, NULL, '', '', 1, 'Blue enamel');
INSERT INTO public.products VALUES (91, 'Twin Star', 'سوار النجمة التوأم', 'A circle of strength for the bold at heart. Twin Star celebrates balance and connection creating gentle asymmetry and a modern, timeless feel. It reflects two stars shining together.
Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'دائرة قوة لأصحاب القلوب الجريئة. يحتفي تصميم "النجمة التوأم" بالتوازن والترابط، خالقاً تبايناً رقيقاً وإحساساً عصرياً خالداً. إنه يعكس نجمين يتألقان معاً

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 916.00, 1, '18K White Gold', 'Natural Diamonds', '', true, 'twin-star', '2025-12-20 12:34:21.133227', '2026-01-20 05:42:11.920562', false, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

ا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا', 2, '');
INSERT INTO public.products VALUES (50, 'Vetra', 'فيترا', 'Vetra ring is a bold expression of modern elegance. Crafted in luminous gold, its sculpted geometric pattern creates depth and movement, while the subtle diamond accents add a refined touch of brilliance.
Vetra is designed to those who appreciate artistry, strength, and timeless beauty in a single ring.

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'خاتم فيترا تعبيرٌ جريءٌ عن الأناقة العصرية. مصنوعٌ من الذهب المتألق، يُضفي نمطه الهندسي المنحوت عمقًا وحركةً، بينما تُضفي لمسات الألماس الرقيقة لمسةً راقيةً من التألق.

صُمم فيترا لمن يُقدّرون الفن والقوة والجمال الخالد في خاتمٍ واحد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3005.00, 0, '18K Rose Gold', 'Natural Diamonds', '', true, 'vetra-1', '2025-12-15 16:08:03.557665', '2026-01-22 10:52:09.748429', false, false, NULL, 'RG_Vetra_ring_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 6, '');
INSERT INTO public.products VALUES (37, 'VENÈ', 'VENÈ', 'A Bold yet sophisticated piece that brings structure, shine, and confidence to the wrist.

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'قطعة جريئة وأنيقة في الوقت نفسه، تضفي على المعصم هيكلاً ولمعاناً وثقة

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 1866.00, 0, '18K Rose Gold', 'Natural Diamonds', '', true, 'B-RG-VENE-005', '2025-12-14 08:25:38.501239', '2026-01-22 10:53:09.67973', false, false, NULL, 'RG_V_by_Vene_Video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 2, '');
INSERT INTO public.products VALUES (120, 'Beirut Domes Necklace', 'Beirut Domes Necklace', 'Inspired by Beirut’s iconic domed architecture, this necklace captures timeless elegance and resilience in a refined, sculptural form.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'مستوحاة من العمارة المقببة الشهيرة لبيروت، تجسد هذه القلادة الأناقة الخالدة والصمود في شكل منحوت راقٍ

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3543.00, 0, '18K Yellow Gold', '', '', true, 'beirut-domes-necklace-2', '2026-01-23 19:15:24.592387', '2026-01-27 15:38:48.918777', false, false, NULL, 'YG_Beirut_Domes_Necklace_video.mp4', false, NULL, '', '', 1, 'Blue enamel');
INSERT INTO public.products VALUES (56, 'Blush Promise ', 'Blush Promise', 'Elegant, intimate, and timeless, Blush Promise is a vow made visible — a ring for the love you carry softly, yet forever.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أنيق، حميمي، وخالد، خاتم "بلاش بروميس" هو عهدٌ مُجسّد - خاتمٌ للحب الذي تحملينه برقة، ولكنه أبدي

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، كما أنها تختلف باختلاف حجم الخاتم الذي تطلبينه.
  لمزيد من المعلومات، يرجى التواصل معنا
', 2527.00, 0, '18K White Gold', 'Natural Diamonds', 'Ruby', true, 'blush-promise-3', '2025-12-15 17:57:58.48972', '2026-01-20 05:27:47.954043', false, false, NULL, 'WG_Blush_Promise_Ring_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 3, '');
INSERT INTO public.products VALUES (42, 'Solara Bloom', 'سولارا بلوم', 'Solara Bloom captures the warmth of a sunrise and the tenderness of a flower opening to the light. A glowing yellow gemstone rests at the top like a small sun, radiating warmth and hope. 

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'سولارا بلوم تُجسّد دفء شروق الشمس ونعومة زهرة تتفتح أمام ضوءها. جوهرة صفراء متوهجة تستقر في الأعلى كشمس صغيرة، تشعّ دفئًا وأملًا

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 1331.00, 1, '18K Yellow Gold', 'Natural Diamonds', 'Moissanite', true, 'solara-bloom', '2025-12-15 13:11:48.760053', '2026-01-22 11:48:18.993383', false, false, NULL, 'YG_flower_yellow_stone_pendant.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 11, '');
INSERT INTO public.products VALUES (119, 'Beirut Domes Necklace', 'Beirut Domes Necklace', 'Inspired by Beirut’s iconic domed architecture, this necklace captures timeless elegance and resilience in a refined, sculptural form.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'مستوحاة من العمارة المقببة الشهيرة لبيروت، تجسد هذه القلادة الأناقة الخالدة والصمود في شكل منحوت راقٍ

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3543.00, 0, '18K Yellow Gold', '', '', true, 'beirut-domes-necklace-1', '2026-01-23 19:12:49.478782', '2026-01-27 15:39:14.423346', false, false, NULL, 'YG_Beirut_Domes_Necklace_video.mp4', false, NULL, '', '', 11, 'Blue enamel');
INSERT INTO public.products VALUES (145, 'Wings of Power Bracelet', 'Wings of Power Bracelet', 'The wings of power in red enamel embody prestige, energy, and passion. The deep red color gives them a bold presence and luxurious shine, expressing acquired strength and indomitable confidence.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أجنحة القوة بالمينا الحمراء تجسّد الهيبة والطاقة والشغف. اللون الأحمر العميق يمنحها حضورًا جريئًا ولمعانًا فاخرًا، لتعبّر عن قوة مكتسبة وثقة لا تُهزم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3028.00, 0, '18K White Gold', 'Natural Diamonds', '', true, 'wings-of-power-bracelet', '2026-01-29 06:39:14.224828', '2026-01-29 06:39:14.224828', false, false, NULL, NULL, false, NULL, '', '', 2, 'Red Enamel');
INSERT INTO public.products VALUES (62, 'Moon Star Necklace', 'قلادة نجمة القمر', 'Carry the universe close to your heart!
The Moon Star necklace features a golden crescent and star brought together in a striking celestial design. Diamonds adorn the curves and points, adding brilliance and depth to the sculpted forms.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'احتضني الكون في قلبك
 تتميز قلادة نجمة القمر بهلال وبدر ونجمة متجاورين في تصميم سماوي خلاب. تزين أحجار الألماس المنحنيات، مما يضفي بريقاً وعمقاً على التصميم 

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2297.00, 1, '18K Yellow Gold', 'Natural Diamonds', '', true, 'moon-star-necklace-1', '2025-12-15 20:11:06.689615', '2026-01-20 05:36:48.79911', false, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 11, '');
INSERT INTO public.products VALUES (147, 'Wings of Power Bracelet', 'Wings of Power Bracelet', 'The wings of power in red enamel embody prestige, energy, and passion. The deep red color gives them a bold presence and luxurious shine, expressing acquired strength and indomitable confidence.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أجنحة القوة بالمينا الحمراء تجسّد الهيبة والطاقة والشغف. اللون الأحمر العميق يمنحها حضورًا جريئًا ولمعانًا فاخرًا، لتعبّر عن قوة مكتسبة وثقة لا تُهزم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3028.00, 0, '18K Yellow Gold', 'Natural Diamonds', '', true, 'wings-of-power-bracelet-2', '2026-01-29 06:44:06.884465', '2026-01-29 06:44:06.884465', false, false, NULL, NULL, false, NULL, '', '', 2, 'Red Enamel');
INSERT INTO public.products VALUES (74, 'V By VENÈ ', 'V By VENÈ', 'A Bold yet sophisticated piece that brings structure, shine, and confidence to the wrist.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'قطعة جريئة وأنيقة في الوقت نفسه، تضفي على المعصم هيكلاً ولمعاناً وثقة

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1866.00, 0, '18K Rose Gold', 'Natural Diamonds', '', true, 'v-by-vene-1', '2025-12-16 18:36:34.828388', '2026-01-22 10:53:30.128792', false, false, NULL, 'RG_V_by_Vene_Video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 13, '');
INSERT INTO public.products VALUES (85, 'Vera V Pendant', 'Vera V Pendant', 'A bold yet elegant necklace, crafted in a geometric design for those who likes to shine different in every moment.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'قلادة جريئة وأنيقة في آن واحد، مصممة بتصميم هندسي لمن يرغب في التألق بشكل مختلف في كل لحظة

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 1501.00, 1, '18K Yellow Gold', 'Natural Diamonds', '', true, 'vera-v-pendant-1', '2025-12-20 09:03:28.885267', '2026-01-23 20:05:45.36428', false, false, NULL, '3_necklaces_video.MP4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 11, '');
INSERT INTO public.products VALUES (121, 'Blue Enamel Ring', 'Blue Enamel Ring', 'A blue enamel flower ring features a delicately sculpted floral design, coated in smooth, glossy blue enamel that brings the petals to life. The ring feels playful, luminous, and effortlessly eye-catching.
Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'خاتم زهرة مطلي بالمينا الزرقاء يتميز بتصميم زهري منحوت بدقة، ومغطى بمينا زرقاء ناعمة ولامعة تضفي على البتلات حيويةً وجمالاً. يُضفي الخاتم إحساساً بالمرح والتألق، ويلفت الأنظار بكل سهولة
يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1700.00, 0, '18K White Gold', '', '', true, 'beirut-domes-ring', '2026-01-23 19:22:46.502675', '2026-01-27 07:46:36.101099', false, false, NULL, 'WG_Beirut_Domes_Ring_video.mp4', false, NULL, '', '', 7, 'Blue enamel');
INSERT INTO public.products VALUES (146, 'Wings of Power Bracelet', 'Wings of Power Bracelet', 'The wings of power in red enamel embody prestige, energy, and passion. The deep red color gives them a bold presence and luxurious shine, expressing acquired strength and indomitable confidence.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أجنحة القوة بالمينا الحمراء تجسّد الهيبة والطاقة والشغف. اللون الأحمر العميق يمنحها حضورًا جريئًا ولمعانًا فاخرًا، لتعبّر عن قوة مكتسبة وثقة لا تُهزم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3028.00, 0, '18K White Gold', 'Natural Diamonds', '', true, 'wings-of-power-bracelet-1', '2026-01-29 06:41:13.674943', '2026-01-29 06:41:13.674943', false, false, NULL, NULL, false, NULL, '', '', 14, 'Red Enamel');
INSERT INTO public.products VALUES (63, 'Ocean Light Necklace', 'قلادة ضوء المحيط', 'Ocean light is a pendant that captures the calm beauty of the sea. The centerpiece is radiant blue stone that glimmers like sunlight dancing on ocean waves. Beneath it, a delicate floral motif adds softness and grace.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.', 'قلادة "ضوء المحيط" تُجسّد جمال البحر الهادئ. القطعة المركزية عبارة عن حجر أزرق متألق يتلألأ كضوء الشمس على أمواج المحيط. أسفلها، نقشة زهرية رقيقة تُضفي عليها نعومةً وأناقةً

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم لقطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1331.00, 1, '18K White Gold', 'Natural Diamonds', 'Sea Blue Moissanite', true, 'ocean-light-necklace', '2025-12-15 20:28:24.479753', '2026-01-22 11:48:49.956162', false, false, NULL, 'WG_Ocean_Light_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 10, '');
INSERT INTO public.products VALUES (90, 'Infinite Love Necklace', 'قلادة الحب الأبدي', 'Two flowing, asymmetrical curves intervene gracefully to form an abstract heart, symbolizing the connection of infinite love of two souls.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'يتداخل منحنيان متدفقان وغير متماثلين برشاقة ليشكلا قلبًا مجردًا، يرمز إلى اتصال الحب اللامتناهي بين روحين

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1276.00, 1, '18K White Gold', 'Natural Diamonds', '', true, 'infinite-love-necklace', '2025-12-20 10:31:44.72442', '2026-01-23 20:04:56.704051', false, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 1, '');
INSERT INTO public.products VALUES (35, 'Hearts in Love Bracelet', 'سوار قلوب في الحب', 'An elegant hearts bracelet made to mark you meaningful moment. This bracelet speaks softly but deeply, perfect for wearing alone or stacked

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'سوار أنيق على شكل قلوب، مصمم لتخليد لحظاتك المميزة. هذا السوار يعبّر عن مشاعر رقيقة وعميقة، وهو مثالي للارتداء بمفرده أو مع أساور أخرى

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 2600.00, 0, '18K Yellow Gold', 'Natural Diamonds', '', true, 'hearts-in-love-bracelet-1', '2025-12-14 07:56:05.2339', '2026-01-25 08:34:34.112892', true, false, NULL, 'YG_Hearts_Bracelet_2_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 2, '');
INSERT INTO public.products VALUES (32, 'Hearts in Love -Bracelet chain', 'قلوب في الحب', 'A delicate Hearts in Love bracelet captures the essence of love in its purest form. Designed to symbolize love, connection, and timeless beauty. Crafted with love  to be worn for every day or at your special moments.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.



', 'سوار "قلوب في الحب" الرقيق يجسد جوهر الحب في أنقى صوره. صُمم ليرمز إلى الحب والترابط والجمال الخالد. صُنع بحب ليُرتدى كل يوم أو في مناسباتك الخاصة

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 2500.00, 0, '18K Yellow Gold', 'Natural Diamonds', '', true, 'hearts-in-love-bracelet-chain-1', '2025-12-14 07:35:59.401832', '2026-01-25 08:47:37.136709', false, false, NULL, 'YG_Hearts_Breaclet_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 2, '');
INSERT INTO public.products VALUES (148, 'Wings of Power Bracelet', 'Wings of Power Bracelet', 'The wings of power in red enamel embody prestige, energy, and passion. The deep red color gives them a bold presence and luxurious shine, expressing acquired strength and indomitable confidence.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أجنحة القوة بالمينا الحمراء تجسّد الهيبة والطاقة والشغف. اللون الأحمر العميق يمنحها حضورًا جريئًا ولمعانًا فاخرًا، لتعبّر عن قوة مكتسبة وثقة لا تُهزم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3028.00, 0, '18K Yellow Gold', 'Natural Diamonds', '', true, 'wings-of-power-bracelet-3', '2026-01-29 06:45:08.295487', '2026-01-29 06:45:08.295487', false, false, NULL, NULL, false, NULL, '', '', 16, 'Red Enamel');
INSERT INTO public.products VALUES (149, 'Wings of Power Bracelet', 'Wings of Power Bracelet', 'The wings of power in red enamel embody prestige, energy, and passion. The deep red color gives them a bold presence and luxurious shine, expressing acquired strength and indomitable confidence.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أجنحة القوة بالمينا الحمراء تجسّد الهيبة والطاقة والشغف. اللون الأحمر العميق يمنحها حضورًا جريئًا ولمعانًا فاخرًا، لتعبّر عن قوة مكتسبة وثقة لا تُهزم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3028.00, 0, '18K Rose Gold', 'Natural Diamonds', '', true, 'wings-of-power-bracelet-4', '2026-01-29 06:46:21.894946', '2026-01-29 06:46:21.894946', false, false, NULL, NULL, false, NULL, '', '', 2, 'Red Enamel');
INSERT INTO public.products VALUES (150, 'Wings of Power Bracelet', 'Wings of Power Bracelet', 'The wings of power in red enamel embody prestige, energy, and passion. The deep red color gives them a bold presence and luxurious shine, expressing acquired strength and indomitable confidence.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'أجنحة القوة بالمينا الحمراء تجسّد الهيبة والطاقة والشغف. اللون الأحمر العميق يمنحها حضورًا جريئًا ولمعانًا فاخرًا، لتعبّر عن قوة مكتسبة وثقة لا تُهزم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3028.00, 0, '18K Rose Gold', 'Natural Diamonds', '', true, 'wings-of-power-bracelet-5', '2026-01-29 06:48:05.02644', '2026-01-29 06:48:05.02644', false, false, NULL, NULL, false, NULL, '', '', 13, 'Red Enamel');
INSERT INTO public.products VALUES (40, 'Vetra Bracelet', 'سوار فيترا', 'Vetra bracelet is a bold expression of modern elegance. Crafted in luminous gold, its sculpted geometric pattern creates depth and movement, while the subtle diamond accents add a refined touch of brilliance.
Vetra is designed to those who appreciate artistry, strength, and timeless beauty.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'سوار فيترا تعبيرٌ جريءٌ عن الأناقة العصرية. مصنوعٌ من الذهب المتألق، يُضفي نمطه الهندسي المنحوت عمقًا وحركةً، بينما تُضفي لمسات الألماس الرقيقة لمسةً راقيةً من التألق.

صُمم فيترا لمن يُقدّرون الفن والقوة والجمال الخالد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 7601.00, 0, '18K Yellow Gold', 'Natural Diamonds', '', true, 'vetra-bracelet', '2025-12-15 12:44:24.731241', '2026-01-25 08:35:16.118529', false, false, NULL, 'YG_Vetra_Bracelet_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 2, '');
INSERT INTO public.products VALUES (151, 'Azure Crown', 'أزور كراون', 'This necklace feels regal without being heavy, luxurious without being overwhelming. It is perfect for someone who wants a statement piece that carries depth, elegance, and quiet authority.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'هذا العقد يمنح شعوراً بالفخامة دون أن يكون ثقيلاً، وبالرقي دون أن يكون مبالغاً فيه. إنه مثالي لمن يرغب بقطعة مميزة تعكس عمقاً وأناقةً وجاذبيةً هادئة

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1670.00, 0, '18K White Gold', '', 'Sapphire, Moissanite', true, 'azure-crown', '2026-01-29 15:59:34.799307', '2026-01-29 15:59:34.799307', false, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 1, '');
INSERT INTO public.products VALUES (2, 'Solara bloom', 'Solara bloom', 'Solara Bloom captures the warmth of a sunrise and the tenderness of a flower opening to the light. A glowing yellow gemstone rests at the top like a small sun, radiating warmth and hope. 

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'سولارا بلوم تُجسّد دفء شروق الشمس ونعومة زهرة تتفتح أمام ضوءها. جوهرة صفراء متوهجة تستقر في الأعلى كشمس صغيرة، تشعّ دفئًا وأملًا.

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا.', 1331.00, 1, '18k Yellow gold', ' natural diamonds', 'Moissanite', true, 'N-YG-SB-007', '2025-12-02 12:41:47.498319', '2026-01-22 11:48:02.633105', true, false, NULL, 'WhatsApp_Video_2025-11-22_at_12.40.08.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 1, '');
INSERT INTO public.products VALUES (152, 'Azure Crown', 'أزور كراون', 'This necklace feels regal without being heavy, luxurious without being overwhelming. It is perfect for someone who wants a statement piece that carries depth, elegance, and quiet authority.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'هذا العقد يمنح شعوراً بالفخامة دون أن يكون ثقيلاً، وبالرقي دون أن يكون مبالغاً فيه. إنه مثالي لمن يرغب بقطعة مميزة تعكس عمقاً وأناقةً وجاذبيةً هادئة

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 1670.00, 0, '18K White Gold', '', 'Sapphire, Moissanite', true, 'azure-crown-1', '2026-01-29 16:02:16.627047', '2026-01-29 16:02:16.627047', false, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 10, '');
INSERT INTO public.products VALUES (53, 'Murmur of the Heart', 'همس القلب', 'Murmur of the Heart ring is the perfect piece to declare your love to someone. expressing your love in a soft, intimate feeling that comes directly from the heart. 

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'خاتم "همس القلب" هو القطعة المثالية للتعبير عن حبك لشخص ما، والتعبير عنه بمشاعر رقيقة وحميمية تنبع مباشرة من القلب

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2200.00, 0, '18K Rose Gold', 'Natural Diamonds', 'Peach Morganite', true, 'murmur-of-the-heart-2', '2025-12-15 17:25:05.849845', '2026-01-25 08:29:00.651275', false, false, NULL, 'RG_Peach_Morganite_video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 17, '');
INSERT INTO public.products VALUES (122, 'Blue Enamel Ring', 'Blue Enamel Ring', 'A blue enamel flower ring features a delicately sculpted floral design, coated in smooth, glossy blue enamel that brings the petals to life. The ring feels playful, luminous, and effortlessly eye-catching.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'خاتم زهرة مطلي بالمينا الزرقاء يتميز بتصميم زهري منحوت بدقة، ومغطى بمينا زرقاء ناعمة ولامعة تضفي على البتلات حيويةً وجمالاً. يُضفي الخاتم إحساساً بالمرح والتألق، ويلفت الأنظار بكل سهولة

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1700.00, 0, '18K White Gold', '', '', true, 'blue-enamel-ring', '2026-01-23 19:36:04.723769', '2026-01-27 07:45:49.433583', false, false, NULL, 'WG_Beirut_Domes_Ring_video.mp4', false, NULL, '', '', 3, 'Blue enamel');
INSERT INTO public.products VALUES (117, 'Beirut Domes Earrings', 'Beirut Domes Earrings', '
Inspired by Beirut’s iconic domed architecture, this earrings captures timeless elegance and resilience in a refined, sculptural form.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'مستوحاة من العمارة المقببة الشهيرة لبيروت، يجسد هذا الحلق الأناقة الخالدة والصمود في شكل منحوت راقٍ

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3028.00, 0, '18K White Gold', '', '', true, 'beirut-domes-earrings-1', '2026-01-23 18:56:00.106851', '2026-01-27 15:44:45.049511', false, false, NULL, NULL, false, NULL, '', '', 4, 'Enamel');
INSERT INTO public.products VALUES (49, 'Murmur of the Heart', 'همس القلب', 'Murmur of the Heart ring is the perfect piece to declare your love to someone. expressing your love in a soft, intimate feeling that comes directly from the heart. 

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'خاتم "همس القلب" هو القطعة المثالية للتعبير عن حبك لشخص ما، والتعبير عنه بمشاعر رقيقة وحميمية تنبع مباشرة من القلب

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 2200.00, 0, '18K White Gold', 'Natural Diamonds', 'Peach Morganite', true, 'murmur-of-the-heart', '2025-12-15 15:45:55.816322', '2026-01-25 08:30:34.823281', false, false, NULL, 'WG_Peach_Morganite_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 19, '');
INSERT INTO public.products VALUES (124, 'Blue Enamel Ring', 'Blue Enamel Ring', 'A blue enamel flower ring features a delicately sculpted floral design, coated in smooth, glossy blue enamel that brings the petals to life. The ring feels playful, luminous, and effortlessly eye-catching.
Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'خاتم زهرة مطلي بالمينا الزرقاء يتميز بتصميم زهري منحوت بدقة، ومغطى بمينا زرقاء ناعمة ولامعة تضفي على البتلات حيويةً وجمالاً. يُضفي الخاتم إحساساً بالمرح والتألق، ويلفت الأنظار بكل سهولة
يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1700.00, 0, '18K Yellow Gold', '', '', true, 'blue-enamel-ring-1', '2026-01-23 19:50:38.05396', '2026-01-27 07:46:19.90235', false, false, NULL, 'YG_Beirut_Domes_Ring_video.mp4', false, NULL, '', '', 8, 'Blue enamel');
INSERT INTO public.products VALUES (123, 'Beirut Domes Necklace', 'Beirut Domes Necklace', 'Inspired by Beirut’s iconic domed architecture, this necklace captures timeless elegance and resilience in a refined, sculptural form.
Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'مستوحاة من العمارة المقببة الشهيرة لبيروت، تجسد هذه القلادة الأناقة الخالدة والصمود في شكل منحوت راقٍ
يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3543.00, 0, '18K White Gold', '', '', true, 'beirut-domes-necklace-3', '2026-01-23 19:44:58.687127', '2026-01-27 15:39:40.09491', false, false, NULL, 'WG_Beirut_Domes_necklace_video.mp4', false, NULL, '', '', 10, 'Blue enamel');
INSERT INTO public.products VALUES (25, 'Murmur of the Heart', 'همس القلب', 'Murmur of the Heart ring is the perfect piece to declare your love to someone. expressing your love in a soft, intimate feeling that comes directly from the heart. 

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'خاتم "همس القلب" هو القطعة المثالية للتعبير عن حبك لشخص ما، والتعبير عنه بمشاعر رقيقة وحميمية تنبع مباشرة من القلب.

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا.
', 2200.00, 1, '18K White Gold', 'Natural Diamonds', 'Peach Morganite', true, 'R-WG-MH-53-007', '2025-12-10 05:41:38.169902', '2026-01-25 08:30:15.791036', false, false, NULL, 'WG_Peach_Morganite_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 5, '');
INSERT INTO public.products VALUES (153, 'Little Star', 'Little Star', 'Soft, and perfect for daily wear. It feels light, personal, and effortless, like a small touch of shine you carry every day.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'ناعم، ومثالي للارتداء اليومي. إنه خفيف، وشخصي، وسهل الاستخدام، مثل لمسة صغيرة من اللمعان تحملينها كل يوم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1450.00, 0, '18K White Gold', '', 'Moissanite', true, 'little-star', '2026-01-29 16:16:49.424937', '2026-01-29 16:16:49.424937', false, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 1, '');
INSERT INTO public.products VALUES (154, 'Little Star', 'Little Star', 'Soft, and perfect for daily wear. It feels light, personal, and effortless, like a small touch of shine you carry every day.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'ناعم، ومثالي للارتداء اليومي. إنه خفيف، وشخصي، وسهل الاستخدام، مثل لمسة صغيرة من اللمعان تحملينها كل يوم

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا


', 1450.00, 0, '18K White Gold', '', 'Moissanite', true, 'little-star-1', '2026-01-29 16:19:16.803073', '2026-01-29 16:19:16.803073', false, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 10, '');
INSERT INTO public.products VALUES (58, 'Vetra', 'فيترا', 'Vetra ring is a bold expression of modern elegance. Crafted in luminous gold, its sculpted geometric pattern creates depth and movement, while the subtle diamond accents add a refined touch of brilliance.
Vetra is designed to those who appreciate artistry, strength, and timeless beauty in a single ring.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.

', 'خاتم فيترا تعبيرٌ جريءٌ عن الأناقة العصرية. مصنوعٌ من الذهب المتألق، يُضفي نمطه الهندسي المنحوت عمقًا وحركةً، بينما تُضفي لمسات الألماس الرقيقة لمسةً راقيةً من التألق

صُمم فيترا لمن يُقدّرون الفن والقوة والجمال الخالد في خاتمٍ واحد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3005.00, 1, '18K White Gold', 'Natural Diamonds', '', true, 'vetra-5', '2025-12-15 18:18:27.426212', '2026-01-23 19:55:42.03178', false, false, NULL, 'WG_Vetra_ring_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 3, '');
INSERT INTO public.products VALUES (30, 'Majesty in Violet', 'Majesty in Violet', 'The Majesty in Violet ring showcases a vivid violet spinel surrounded by natural diamonds and elegant marquise cuts arranged in a crown-inspired design.

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'يتميز خاتم Majesty in Violet بحجر سبينل بنفسجي نابض بالحياة محاط بألماس طبيعي وقطع ماركيز أنيقة مرتبة في تصميم مستوحى من التاج

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا.
', 3594.00, 1, '18K White Gold', 'Natural round diamonds and marquise shaped diamonds', 'Purple Spinel ', true, 'R-WG-MV-53-007', '2025-12-13 09:05:31.616501', '2026-01-23 19:57:03.732537', false, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 3, '');
INSERT INTO public.products VALUES (110, 'Rosa Light Necklace ', 'قلادة روزا لايت', 'Rosa Light is a refined piece that feels light, romantic, effortlessly elegant. It reflects purity, and romance. 

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'روزا لايت قطعة راقية تتميز بالخفة والرومانسية والأناقة العفوية. إنها تعكس النقاء والرومانسية

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1500.00, 1, '18K White Gold', '', 'Ruby Fuchsia, Pink Tourmaline, Amethyst, Moissanite', true, 'rosa-light-necklace-1', '2026-01-22 19:58:03.114011', '2026-01-26 07:05:49.550547', false, false, NULL, NULL, false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 10, '');
INSERT INTO public.products VALUES (106, 'Solar Flora Ring', 'خاتم سولار فلورا', 'Solar Flora blends golden light and floral elegance, where two radiant blooms shine with warmth, balance, and timeless beauty.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'يمزج سولار فلورا بين الضوء الذهبي والأناقة الزهرية، حيث تتألق زهرتان مشرقتان بالدفء والتوازن والجمال الخالد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3702.00, 1, '18K White Gold', 'Natural Round Diamonds and Marquise', 'Golden Moissanite', true, 'solar-flora-ring', '2026-01-22 19:24:30.81211', '2026-01-23 19:57:59.285461', false, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 3, '');
INSERT INTO public.products VALUES (11, 'Vetra', 'فيترا', 'Vetra ring is a bold expression of modern elegance. Crafted in luminous gold, its sculpted geometric pattern creates depth and movement, while the subtle diamond accents add a refined touch of brilliance.
Vetra is designed to those who appreciate artistry, strength, and timeless beauty in a single ring.

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'خاتم فيترا تعبيرٌ جريءٌ عن الأناقة العصرية. مصنوعٌ من الذهب المتألق، يُضفي نمطه الهندسي المنحوت عمقًا وحركةً، بينما تُضفي لمسات الألماس الرقيقة لمسةً راقيةً من التألق.

صُمم فيترا لمن يُقدّرون الفن والقوة والجمال الخالد في خاتمٍ واحد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3005.00, 1, '18K Yellow Gold', '0.27 Ct Natural Diamonds', '', true, 'vetra', '2025-12-09 05:50:45.764043', '2026-01-23 19:58:39.90273', false, false, NULL, 'YG_Vetra_ring_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 8, '');
INSERT INTO public.products VALUES (47, 'Evergreen Crown Ring', 'خاتم تاج البهاء الدائم', 'Evergreen crown symbolize a life that remains vibrant through every season. The design mirrors this timeless resilience: a radiant green sapphire at the side of the design giving it bold and unconventional character, while the surrounding marquise diamonds form a graceful, crown-like halo that captures light from every angle.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'يرمز تاج البهاء الدائم إلى حياةٍ نابضةٍ بالحياة في كل موسم. يعكس التصميم هذه المرونة الخالدة: ياقوتة خضراء متألقة في جانب التصميم تُجسّد الجرأة وتمنحه طابعا غير تقليدي، بينما تُشكّل ماسات الماركيز المحيطة بها هالةً أنيقةً تُشبه التاج، تجذب الضوء من كل زاوية

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3125.00, 1, '18K White Gold', 'Natural Diamonds', '1.39 ct Green Sapphire', true, 'evergreen-crown-ring-1', '2025-12-15 15:31:52.218974', '2026-01-23 20:00:05.850502', false, false, NULL, 'WG_Evergreen_crown_ring_2.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 7, '');
INSERT INTO public.products VALUES (88, 'Silent Waterfall Necklace', 'قلادة الشلال الهادئ', 'The Silent Waterfall necklace captures the calm beauty of flowing water in a refreshed, modern form.
Each line appears to flow into the next, creating a sense of movement while maintaining a clean, minimalist elegance.
 
Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'يجسد عقد "الشلال الهادئ" جمال الماء المتدفق الهادئ في تصميم عصري متجدد

يبدو كل خط وكأنه ينساب بسلاسة إلى الخط الذي يليه، مما يخلق إحساسًا بالحركة مع الحفاظ على أناقة بسيطة وأنيقة

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 1523.00, 1, '18K White Gold', 'Natural Diamonds', '', true, 'silent-waterfall-necklace', '2025-12-20 10:13:58.467156', '2026-01-23 20:02:20.77103', false, false, NULL, '3_necklaces_video.MP4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 1, '');
INSERT INTO public.products VALUES (103, 'Solar Flora Necklace', 'قلادة سولار فلورا ', 'Solar Flora blends golden light and floral elegance, where two radiant blooms shine with warmth, balance, and timeless beauty.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'يمزج سولار فلورا بين الضوء الذهبي والأناقة الزهرية، حيث تتألق زهرتان مشرقتان بالدفء والتوازن والجمال الخالد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 4533.00, 1, '18K White Gold', 'Natural Round Diamonds and Marquise', 'Golden Moissanite', true, 'solar-flora-necklace', '2026-01-22 19:08:25.930833', '2026-01-23 20:02:46.379808', false, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 1, '');
INSERT INTO public.products VALUES (104, 'Solar Flora Necklace', 'قلادة سولار فلورا ', 'Solar Flora blends golden light and floral elegance, where two radiant blooms shine with warmth, balance, and timeless beauty.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'يمزج سولار فلورا بين الضوء الذهبي والأناقة الزهرية، حيث تتألق زهرتان مشرقتان بالدفء والتوازن والجمال الخالد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 4533.00, 1, '18K White Gold', 'Natural Round Diamonds and Marquise', 'Golden Moissanite', true, 'solar-flora-necklace-1', '2026-01-22 19:11:21.49458', '2026-01-23 20:06:23.379036', false, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 10, '');
INSERT INTO public.products VALUES (87, 'Vetra', 'فيترا', '
Vetra ring is a bold expression of modern elegance. Crafted in luminous gold, its sculpted geometric pattern creates depth and movement, while the subtle diamond accents add a refined touch of brilliance.
Vetra is designed to those who appreciate artistry, strength, and timeless beauty in a single ring.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'خاتم فيترا تعبيرٌ جريءٌ عن الأناقة العصرية. مصنوعٌ من الذهب المتألق، يُضفي نمطه الهندسي المنحوت عمقًا وحركةً، بينما تُضفي لمسات الألماس الرقيقة لمسةً راقيةً من التألق

صُمم فيترا لمن يُقدّرون الفن والقوة والجمال الخالد في خاتمٍ واحد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 3005.00, 1, '18K Yellow Gold', '0.27 Ct Natural Diamonds', '', true, 'vetra-10', '2025-12-20 09:27:07.854248', '2026-01-23 20:10:56.150543', false, false, NULL, 'YG_Vetra_ring_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 18, '');
INSERT INTO public.products VALUES (41, 'Vetra Bracelet', 'سوار فيترا', 'Vetra bracelet is a bold expression of modern elegance. Crafted in luminous gold, its sculpted geometric pattern creates depth and movement, while the subtle diamond accents add a refined touch of brilliance.
Vetra is designed to those who appreciate artistry, strength, and timeless beauty.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.


', 'سوار فيترا تعبيرٌ جريءٌ عن الأناقة العصرية. مصنوعٌ من الذهب المتألق، يُضفي نمطه الهندسي المنحوت عمقًا وحركةً، بينما تُضفي لمسات الألماس الرقيقة لمسةً راقيةً من التألق.

صُمم فيترا لمن يُقدّرون الفن والقوة والجمال الخالد

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا

', 7601.00, 0, '18K Rose Gold', 'Natural Diamonds', '', true, 'vetra-bracelet-1', '2025-12-15 12:53:35.929072', '2026-01-25 08:13:45.001429', false, false, NULL, 'RG_Vetra_Bracelet._video.mp4', false, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع.

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 13, '');
INSERT INTO public.products VALUES (61, 'Murmur of the Heart', 'همس القلب', 'Murmur of the Heart ring is the perfect piece to declare your love to someone. expressing your love in a soft, intimate feeling that comes directly from the heart. 

Please note that the actual color and stones characteristics may differ slightly from how the appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', '
خاتم "همس القلب" هو القطعة المثالية للتعبير عن حبك لشخص ما، والتعبير عنه بمشاعر رقيقة وحميمية تنبع مباشرة من 
القلب

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2200.00, 0, '18K Yellow Gold', 'Natural Diamonds', 'Peach Morganite', true, 'murmur-of-the-heart-4', '2025-12-15 18:30:04.19652', '2026-01-25 18:51:11.019152', false, false, NULL, 'YG_Peach_Morganite_video.mp4', true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 3, '');
INSERT INTO public.products VALUES (83, 'Black Heart Ommi Necklace', 'قلادة أمي مع حجر أسود', 'Express your love for the dearest person to your heart with a heart-shaped necklace with a black stone featuring the word "Mom" engraved in yellow gold. You can wear this necklace on both sides.

Please note that the actual color and stones characteristics may differ slightly from how they appear in images and will vary based on the size of the creation you order. For more detailed information, please contact us.
', 'عبري عن حبك لأعز الناس الى قلبك بقلادة على شكل قلب مع حجر أسود فيها كلمة أمي محفورة بالذهب الأصفر. يمكنك ارتداء هذه القلادة على الوجهين

يرجى ملاحظة أن اللون الفعلي وخصائص الأحجار قد تختلف قليلاً عما يظهر في الصور، وستختلف بناءً على حجم القطعة التي تطلبها. لمزيد من المعلومات، يرجى التواصل معنا
', 2076.00, 1, '18K Yellow Gold', 'Natural Diamonds', '', true, 'black-heart-ommi-necklace', '2025-12-17 09:26:05.712794', '2026-01-30 10:50:49.444288', false, false, NULL, NULL, true, NULL, 'All pre-order items are specially crafted upon confirmation of your purchase and requires additional production time. 

If you would like any specific changes of stones colors, please contact us.
', 'تُصنع جميع المنتجات المطلوبة مسبقًا خصيصًا بعد تأكيد طلبك، ويتطلب ذلك وقتًا إضافيًا للتصنيع

إذا كنت ترغب في أي تغييرات محددة في ألوان الأحجار، يُرجى التواصل معنا
', 20, '');


--
-- Data for Name: banners; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.banners VALUES (3, 'Majesty_in_Violet_ring-banner.png', 'Elegant, intimate, and tactile Jewelry', '', 'Discover unique pieces for every occasion with style.', '', true, 1, NULL, '', '2025-12-08 06:15:29.722999', '2025-12-08 12:00:34.208115');
INSERT INTO public.banners VALUES (1, 'ِEvergreen_crown_ring_banner.jpeg', 'Shine in Every Moment', 'Shine in Every Moment', 'Discover timeless pieces crafted to elevate your everyday elegance.', 'Discover timeless pieces crafted to elevate your everyday elegance.', true, 0, NULL, '', '2025-12-02 11:14:48.008128', '2025-12-08 15:50:23.816343');
INSERT INTO public.banners VALUES (2, 'square_necklace_banner.jpeg', 'Where Beauty Meets Craftsmanship', '', 'Hand-finished designs that celebrate your unique style.', '', true, 2, NULL, '', '2025-12-02 11:15:09.50868', '2025-12-08 18:57:58.983856');


--
-- Data for Name: coupons; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: variant_types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.variant_types VALUES (1, 'Size', '', true, '2025-12-02 12:32:26.493089', '2025-12-02 12:32:26.493089');


--
-- Data for Name: variant_options; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.variant_options VALUES (1, 1, '52', 0, true, '2025-12-02 12:32:26.523254', '2025-12-02 12:32:26.523254');
INSERT INTO public.variant_options VALUES (2, 1, '53', 0, true, '2025-12-02 12:32:26.529493', '2025-12-02 12:32:26.529493');
INSERT INTO public.variant_options VALUES (3, 1, '54', 0, true, '2025-12-02 12:32:26.532867', '2025-12-02 12:32:26.532867');
INSERT INTO public.variant_options VALUES (4, 1, '55', 0, true, '2025-12-02 12:32:26.536081', '2025-12-02 12:32:26.536081');
INSERT INTO public.variant_options VALUES (5, 1, '56', 1, true, '2025-12-02 12:32:26.539409', '2025-12-02 12:32:26.539409');
INSERT INTO public.variant_options VALUES (6, 1, '57', 2, true, '2025-12-02 12:32:26.542775', '2025-12-02 12:32:26.542775');
INSERT INTO public.variant_options VALUES (7, 1, '58', 3, true, '2025-12-02 12:32:26.546151', '2025-12-02 12:32:26.546151');


--
-- Data for Name: product_variants; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.product_variants VALUES (26, 8, NULL, NULL, 0, true, '2025-12-13 06:36:16.569341', '2025-12-13 06:36:16.569341', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (4, 8, NULL, NULL, 0, true, '2025-12-08 16:53:30.549455', '2025-12-13 06:36:16.594055', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (27, 8, NULL, NULL, 0, true, '2025-12-13 06:36:16.628384', '2025-12-13 06:36:16.628384', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (28, 8, NULL, NULL, 0, true, '2025-12-13 06:36:16.64449', '2025-12-13 06:36:16.64449', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (29, 8, NULL, NULL, 0, true, '2025-12-13 06:36:16.657506', '2025-12-13 06:36:16.657506', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (30, 8, NULL, NULL, 0, true, '2025-12-13 06:36:16.670824', '2025-12-13 06:36:16.670824', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (31, 8, NULL, NULL, 0, true, '2025-12-13 06:36:16.694022', '2025-12-13 06:36:16.694022', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (32, 6, NULL, NULL, 0, true, '2025-12-13 06:38:03.722247', '2025-12-13 06:38:03.722247', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (33, 6, NULL, NULL, 0, true, '2025-12-13 06:38:03.755674', '2025-12-13 06:38:03.755674', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (34, 6, NULL, NULL, 0, true, '2025-12-13 06:38:03.768755', '2025-12-13 06:38:03.768755', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (35, 6, NULL, NULL, 0, true, '2025-12-13 06:38:03.78096', '2025-12-13 06:38:03.78096', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (36, 6, NULL, NULL, 0, true, '2025-12-13 06:38:03.802354', '2025-12-13 06:38:03.802354', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (37, 6, NULL, NULL, 0, true, '2025-12-13 06:38:03.824141', '2025-12-13 06:38:03.824141', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (20, 5, NULL, NULL, 0, true, '2025-12-13 06:30:09.44749', '2025-12-13 06:39:32.164395', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (1, 5, NULL, NULL, 0, true, '2025-12-08 16:15:53.047859', '2025-12-13 06:39:32.176273', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (21, 5, NULL, NULL, 0, true, '2025-12-13 06:30:09.536795', '2025-12-13 06:39:32.184752', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (22, 5, NULL, NULL, 0, true, '2025-12-13 06:30:09.551944', '2025-12-13 06:39:32.19301', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (23, 5, NULL, NULL, 0, true, '2025-12-13 06:30:09.565547', '2025-12-13 06:39:32.204471', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (24, 5, NULL, NULL, 0, true, '2025-12-13 06:30:09.578399', '2025-12-13 06:39:32.21764', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (25, 5, NULL, NULL, 0, true, '2025-12-13 06:30:09.596906', '2025-12-13 06:39:32.227759', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (38, 4, NULL, NULL, 0, true, '2025-12-13 06:40:51.713502', '2025-12-13 06:40:51.713502', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (39, 4, NULL, NULL, 1, true, '2025-12-13 06:40:51.725488', '2025-12-13 06:40:51.725488', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (40, 4, NULL, NULL, 0, true, '2025-12-13 06:40:51.73569', '2025-12-13 06:40:51.73569', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (41, 4, NULL, NULL, 0, true, '2025-12-13 06:40:51.74503', '2025-12-13 06:40:51.74503', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (42, 4, NULL, NULL, 0, true, '2025-12-13 06:40:51.757307', '2025-12-13 06:40:51.757307', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (43, 4, NULL, NULL, 0, true, '2025-12-13 06:40:51.767102', '2025-12-13 06:40:51.767102', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (44, 4, NULL, NULL, 0, true, '2025-12-13 06:40:51.775828', '2025-12-13 06:40:51.775828', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (45, 23, NULL, NULL, 0, true, '2025-12-13 06:46:20.428049', '2025-12-13 06:46:20.428049', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (46, 23, NULL, NULL, 0, true, '2025-12-13 06:46:20.45049', '2025-12-13 06:46:20.45049', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (47, 23, NULL, NULL, 0, true, '2025-12-13 06:46:20.460994', '2025-12-13 06:46:20.460994', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (48, 23, NULL, NULL, 0, true, '2025-12-13 06:46:20.471443', '2025-12-13 06:46:20.471443', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (49, 23, NULL, NULL, 0, true, '2025-12-13 06:46:20.480732', '2025-12-13 06:46:20.480732', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (50, 23, NULL, NULL, 0, true, '2025-12-13 06:46:20.491932', '2025-12-13 06:46:20.491932', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (12, 23, NULL, NULL, 0, true, '2025-12-10 05:29:35.869643', '2025-12-13 06:47:05.220721', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (51, 16, NULL, NULL, 0, true, '2025-12-13 06:48:43.167771', '2025-12-13 06:48:43.167771', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (7, 16, NULL, NULL, 0, true, '2025-12-09 12:05:57.763952', '2025-12-13 06:48:43.180912', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (52, 16, NULL, NULL, 0, true, '2025-12-13 06:48:43.202018', '2025-12-13 06:48:43.202018', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (53, 16, NULL, NULL, 0, true, '2025-12-13 06:48:43.216153', '2025-12-13 06:48:43.216153', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (54, 16, NULL, NULL, 0, true, '2025-12-13 06:48:43.230671', '2025-12-13 06:48:43.230671', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (55, 16, NULL, NULL, 0, true, '2025-12-13 06:48:43.25899', '2025-12-13 06:48:43.25899', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (56, 16, NULL, NULL, 0, true, '2025-12-13 06:48:43.281551', '2025-12-13 06:48:43.281551', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (57, 11, NULL, NULL, 0, true, '2025-12-13 06:50:04.660518', '2025-12-13 06:50:04.660518', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (5, 11, NULL, NULL, 1, true, '2025-12-09 05:50:46.145666', '2025-12-13 06:50:04.684045', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (58, 11, NULL, NULL, 0, true, '2025-12-13 06:50:04.698647', '2025-12-13 06:50:04.698647', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (59, 11, NULL, NULL, 0, true, '2025-12-13 06:50:04.710012', '2025-12-13 06:50:04.710012', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (60, 11, NULL, NULL, 0, true, '2025-12-13 06:50:04.723555', '2025-12-13 06:50:04.723555', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (61, 11, NULL, NULL, 0, true, '2025-12-13 06:50:04.733665', '2025-12-13 06:50:04.733665', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (62, 11, NULL, NULL, 0, true, '2025-12-13 06:50:04.751933', '2025-12-13 06:50:04.751933', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (63, 15, NULL, NULL, 0, true, '2025-12-13 06:51:43.013623', '2025-12-13 06:51:43.013623', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (64, 15, NULL, NULL, 0, true, '2025-12-13 06:51:43.022969', '2025-12-13 06:51:43.022969', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (66, 15, NULL, NULL, 0, true, '2025-12-13 06:51:43.04481', '2025-12-13 06:51:43.04481', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (67, 15, NULL, NULL, 0, true, '2025-12-13 06:51:43.053466', '2025-12-13 06:51:43.053466', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (68, 15, NULL, NULL, 0, true, '2025-12-13 06:51:43.062447', '2025-12-13 06:51:43.062447', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (69, 15, NULL, NULL, 0, true, '2025-12-13 06:51:43.071198', '2025-12-13 06:51:43.071198', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (70, 13, NULL, NULL, 0, true, '2025-12-13 06:53:09.837963', '2025-12-13 06:53:09.837963', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (71, 13, NULL, NULL, 0, true, '2025-12-13 06:53:09.851678', '2025-12-13 06:53:09.851678', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (72, 13, NULL, NULL, 0, true, '2025-12-13 06:53:09.864197', '2025-12-13 06:53:09.864197', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (73, 13, NULL, NULL, 0, true, '2025-12-13 06:53:09.875008', '2025-12-13 06:53:09.875008', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (74, 13, NULL, NULL, 0, true, '2025-12-13 06:53:09.888691', '2025-12-13 06:53:09.888691', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (75, 13, NULL, NULL, 0, true, '2025-12-13 06:53:09.900353', '2025-12-13 06:53:09.900353', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (76, 13, NULL, NULL, 0, true, '2025-12-13 06:53:09.910109', '2025-12-13 06:53:09.910109', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (77, 18, NULL, NULL, 0, true, '2025-12-13 06:54:45.728372', '2025-12-13 06:54:45.728372', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (9, 18, NULL, NULL, 0, true, '2025-12-09 12:19:29.947763', '2025-12-13 06:54:45.737697', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (78, 18, NULL, NULL, 0, true, '2025-12-13 06:54:45.748809', '2025-12-13 06:54:45.748809', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (79, 18, NULL, NULL, 0, true, '2025-12-13 06:54:45.758622', '2025-12-13 06:54:45.758622', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (80, 18, NULL, NULL, 0, true, '2025-12-13 06:54:45.767486', '2025-12-13 06:54:45.767486', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (81, 18, NULL, NULL, 0, true, '2025-12-13 06:54:45.776287', '2025-12-13 06:54:45.776287', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (82, 18, NULL, NULL, 0, true, '2025-12-13 06:54:45.784505', '2025-12-13 06:54:45.784505', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (14, 7, NULL, NULL, 0, true, '2025-12-13 06:26:14.292325', '2025-12-14 04:30:31.838544', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (3, 7, NULL, NULL, 0, true, '2025-12-08 16:43:28.070919', '2025-12-14 04:30:31.857784', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (15, 7, NULL, NULL, 0, true, '2025-12-13 06:26:14.327767', '2025-12-14 04:30:31.867214', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (16, 7, NULL, NULL, 0, true, '2025-12-13 06:26:14.337725', '2025-12-14 04:30:31.874151', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (17, 7, NULL, NULL, 0, true, '2025-12-13 06:26:14.381452', '2025-12-14 04:30:31.880028', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (18, 7, NULL, NULL, 0, true, '2025-12-13 06:26:14.452941', '2025-12-14 04:30:31.886158', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (19, 7, NULL, NULL, 0, true, '2025-12-13 06:26:14.530907', '2025-12-14 04:30:31.892004', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (8, 17, NULL, NULL, 0, true, '2025-12-09 12:08:03.595086', '2025-12-14 04:37:16.219768', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (6, 12, NULL, NULL, 0, true, '2025-12-09 06:07:23.547573', '2025-12-14 04:38:33.332025', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (65, 15, NULL, NULL, 1, true, '2025-12-13 06:51:43.034963', '2026-01-23 20:09:44.783566', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (2, 6, NULL, NULL, 0, true, '2025-12-08 16:38:10.823847', '2025-12-13 06:38:03.7399', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (83, 25, NULL, NULL, 0, true, '2025-12-13 07:06:03.677219', '2025-12-13 07:06:03.677219', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (13, 25, NULL, NULL, 1, true, '2025-12-10 05:41:38.257893', '2025-12-13 07:06:03.708287', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (84, 25, NULL, NULL, 0, true, '2025-12-13 07:06:03.7232', '2025-12-13 07:06:03.7232', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (85, 25, NULL, NULL, 0, true, '2025-12-13 07:06:03.747594', '2025-12-13 07:06:03.747594', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (86, 25, NULL, NULL, 0, true, '2025-12-13 07:06:03.759807', '2025-12-13 07:06:03.759807', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (87, 25, NULL, NULL, 0, true, '2025-12-13 07:06:03.782825', '2025-12-13 07:06:03.782825', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (88, 25, NULL, NULL, 0, true, '2025-12-13 07:06:03.817113', '2025-12-13 07:06:03.817113', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (89, 24, NULL, NULL, 0, true, '2025-12-13 07:10:14.502855', '2025-12-13 07:10:14.502855', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (90, 24, NULL, NULL, 0, true, '2025-12-13 07:10:14.517569', '2025-12-13 07:10:14.517569', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (91, 24, NULL, NULL, 0, true, '2025-12-13 07:10:14.528976', '2025-12-13 07:10:14.528976', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (92, 24, NULL, NULL, 0, true, '2025-12-13 07:10:14.541485', '2025-12-13 07:10:14.541485', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (93, 24, NULL, NULL, 0, true, '2025-12-13 07:10:14.554409', '2025-12-13 07:10:14.554409', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (94, 24, NULL, NULL, 0, true, '2025-12-13 07:10:14.571935', '2025-12-13 07:10:14.571935', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (95, 24, NULL, NULL, 0, true, '2025-12-13 07:10:14.58362', '2025-12-13 07:10:14.58362', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (96, 29, NULL, NULL, 0, true, '2025-12-13 07:16:16.523775', '2025-12-13 07:16:16.523775', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (97, 29, NULL, NULL, 0, true, '2025-12-13 07:16:16.543659', '2025-12-13 07:16:16.543659', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (98, 29, NULL, NULL, 0, true, '2025-12-13 07:16:16.559142', '2025-12-13 07:16:16.559142', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (99, 29, NULL, NULL, 0, true, '2025-12-13 07:16:16.570714', '2025-12-13 07:16:16.570714', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (100, 29, NULL, NULL, 0, true, '2025-12-13 07:16:16.5825', '2025-12-13 07:16:16.5825', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (101, 29, NULL, NULL, 0, true, '2025-12-13 07:16:16.594258', '2025-12-13 07:16:16.594258', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (102, 29, NULL, NULL, 0, true, '2025-12-13 07:16:16.606524', '2025-12-13 07:16:16.606524', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (103, 30, NULL, NULL, 0, true, '2025-12-13 09:05:31.660761', '2025-12-13 09:05:31.660761', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (104, 30, NULL, NULL, 1, true, '2025-12-13 09:05:31.677333', '2025-12-13 09:05:31.677333', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (105, 30, NULL, NULL, 0, true, '2025-12-13 09:05:31.687513', '2025-12-13 09:05:31.687513', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (106, 30, NULL, NULL, 0, true, '2025-12-13 09:05:31.697807', '2025-12-13 09:05:31.697807', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (107, 30, NULL, NULL, 0, true, '2025-12-13 09:05:31.70807', '2025-12-13 09:05:31.70807', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (108, 30, NULL, NULL, 0, true, '2025-12-13 09:05:31.718532', '2025-12-13 09:05:31.718532', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (109, 30, NULL, NULL, 0, true, '2025-12-13 09:05:31.727839', '2025-12-13 09:05:31.727839', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (110, 21, NULL, NULL, 0, true, '2025-12-14 04:33:43.70886', '2025-12-14 04:33:43.70886', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (11, 21, NULL, NULL, 0, true, '2025-12-09 13:08:02.681098', '2025-12-14 04:33:43.71904', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (111, 21, NULL, NULL, 0, true, '2025-12-14 04:33:43.727649', '2025-12-14 04:33:43.727649', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (112, 21, NULL, NULL, 0, true, '2025-12-14 04:33:43.738378', '2025-12-14 04:33:43.738378', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (113, 21, NULL, NULL, 0, true, '2025-12-14 04:33:43.747213', '2025-12-14 04:33:43.747213', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (114, 21, NULL, NULL, 0, true, '2025-12-14 04:33:43.75392', '2025-12-14 04:33:43.75392', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (115, 21, NULL, NULL, 0, true, '2025-12-14 04:33:43.762651', '2025-12-14 04:33:43.762651', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (116, 17, NULL, NULL, 0, true, '2025-12-14 04:37:16.208639', '2025-12-14 04:37:16.208639', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (117, 17, NULL, NULL, 0, true, '2025-12-14 04:37:16.231892', '2025-12-14 04:37:16.231892', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (118, 17, NULL, NULL, 0, true, '2025-12-14 04:37:16.254821', '2025-12-14 04:37:16.254821', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (119, 17, NULL, NULL, 0, true, '2025-12-14 04:37:16.262354', '2025-12-14 04:37:16.262354', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (120, 17, NULL, NULL, 0, true, '2025-12-14 04:37:16.270981', '2025-12-14 04:37:16.270981', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (121, 17, NULL, NULL, 0, true, '2025-12-14 04:37:16.28045', '2025-12-14 04:37:16.28045', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (122, 12, NULL, NULL, 0, true, '2025-12-14 04:38:33.323915', '2025-12-14 04:38:33.323915', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (124, 12, NULL, NULL, 0, true, '2025-12-14 04:38:33.349375', '2025-12-14 04:38:33.349375', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (125, 12, NULL, NULL, 0, true, '2025-12-14 04:38:33.358421', '2025-12-14 04:38:33.358421', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (126, 12, NULL, NULL, 0, true, '2025-12-14 04:38:33.372732', '2025-12-14 04:38:33.372732', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (127, 12, NULL, NULL, 0, true, '2025-12-14 04:38:33.39429', '2025-12-14 04:38:33.39429', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (128, 14, NULL, NULL, 0, true, '2025-12-14 04:41:00.703625', '2025-12-14 04:41:00.703625', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (129, 14, NULL, NULL, 1, true, '2025-12-14 04:41:00.71605', '2025-12-14 04:41:00.71605', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (130, 14, NULL, NULL, 0, true, '2025-12-14 04:41:00.728671', '2025-12-14 04:41:00.728671', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (131, 14, NULL, NULL, 0, true, '2025-12-14 04:41:00.741331', '2025-12-14 04:41:00.741331', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (132, 14, NULL, NULL, 0, true, '2025-12-14 04:41:00.75826', '2025-12-14 04:41:00.75826', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (133, 14, NULL, NULL, 0, true, '2025-12-14 04:41:00.771831', '2025-12-14 04:41:00.771831', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (134, 14, NULL, NULL, 0, true, '2025-12-14 04:41:00.784186', '2025-12-14 04:41:00.784186', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (135, 44, NULL, NULL, 0, true, '2025-12-15 13:21:47.106013', '2025-12-15 13:21:47.106013', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (136, 44, NULL, NULL, 0, true, '2025-12-15 13:21:47.118521', '2025-12-15 13:21:47.118521', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (137, 44, NULL, NULL, 0, true, '2025-12-15 13:21:47.131987', '2025-12-15 13:21:47.131987', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (138, 44, NULL, NULL, 0, true, '2025-12-15 13:21:47.14759', '2025-12-15 13:21:47.14759', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (139, 44, NULL, NULL, 0, true, '2025-12-15 13:21:47.166112', '2025-12-15 13:21:47.166112', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (140, 44, NULL, NULL, 0, true, '2025-12-15 13:21:47.186106', '2025-12-15 13:21:47.186106', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (141, 44, NULL, NULL, 0, true, '2025-12-15 13:21:47.19825', '2025-12-15 13:21:47.19825', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (142, 45, NULL, NULL, 0, true, '2025-12-15 13:57:34.494339', '2025-12-15 13:57:34.494339', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (143, 45, NULL, NULL, 0, true, '2025-12-15 13:57:34.51694', '2025-12-15 13:57:34.51694', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (144, 45, NULL, NULL, 0, true, '2025-12-15 13:57:34.528462', '2025-12-15 13:57:34.528462', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (145, 45, NULL, NULL, 0, true, '2025-12-15 13:57:34.536779', '2025-12-15 13:57:34.536779', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (146, 45, NULL, NULL, 0, true, '2025-12-15 13:57:34.545987', '2025-12-15 13:57:34.545987', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (147, 45, NULL, NULL, 0, true, '2025-12-15 13:57:34.557051', '2025-12-15 13:57:34.557051', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (148, 45, NULL, NULL, 0, true, '2025-12-15 13:57:34.566323', '2025-12-15 13:57:34.566323', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (149, 46, NULL, NULL, 0, true, '2025-12-15 14:15:24.512329', '2025-12-15 14:15:24.512329', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (150, 46, NULL, NULL, 0, true, '2025-12-15 14:15:24.527985', '2025-12-15 14:15:24.527985', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (151, 46, NULL, NULL, 0, true, '2025-12-15 14:15:24.537821', '2025-12-15 14:15:24.537821', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (152, 46, NULL, NULL, 0, true, '2025-12-15 14:15:24.546429', '2025-12-15 14:15:24.546429', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (153, 46, NULL, NULL, 0, true, '2025-12-15 14:15:24.560545', '2025-12-15 14:15:24.560545', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (154, 46, NULL, NULL, 0, true, '2025-12-15 14:15:24.57173', '2025-12-15 14:15:24.57173', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (155, 46, NULL, NULL, 0, true, '2025-12-15 14:15:24.583294', '2025-12-15 14:15:24.583294', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (156, 47, NULL, NULL, 0, true, '2025-12-15 15:31:52.474652', '2025-12-15 15:31:52.474652', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (157, 47, NULL, NULL, 1, true, '2025-12-15 15:31:52.493413', '2025-12-15 15:31:52.493413', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (158, 47, NULL, NULL, 0, true, '2025-12-15 15:31:52.503467', '2025-12-15 15:31:52.503467', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (159, 47, NULL, NULL, 0, true, '2025-12-15 15:31:52.512297', '2025-12-15 15:31:52.512297', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (160, 47, NULL, NULL, 0, true, '2025-12-15 15:31:52.519035', '2025-12-15 15:31:52.519035', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (161, 47, NULL, NULL, 0, true, '2025-12-15 15:31:52.527425', '2025-12-15 15:31:52.527425', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (162, 47, NULL, NULL, 0, true, '2025-12-15 15:31:52.536095', '2025-12-15 15:31:52.536095', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (163, 48, NULL, NULL, 0, true, '2025-12-15 15:38:57.289705', '2025-12-15 15:38:57.289705', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (164, 48, NULL, NULL, 0, true, '2025-12-15 15:38:57.300632', '2025-12-15 15:38:57.300632', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (165, 48, NULL, NULL, 0, true, '2025-12-15 15:38:57.30743', '2025-12-15 15:38:57.30743', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (166, 48, NULL, NULL, 0, true, '2025-12-15 15:38:57.313271', '2025-12-15 15:38:57.313271', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (167, 48, NULL, NULL, 0, true, '2025-12-15 15:38:57.319221', '2025-12-15 15:38:57.319221', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (168, 48, NULL, NULL, 0, true, '2025-12-15 15:38:57.3285', '2025-12-15 15:38:57.3285', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (169, 48, NULL, NULL, 0, true, '2025-12-15 15:38:57.337537', '2025-12-15 15:38:57.337537', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (170, 49, NULL, NULL, 0, true, '2025-12-15 15:45:55.991491', '2025-12-15 15:45:55.991491', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (171, 49, NULL, NULL, 0, true, '2025-12-15 15:45:56.017954', '2025-12-15 15:45:56.017954', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (172, 49, NULL, NULL, 0, true, '2025-12-15 15:45:56.034218', '2025-12-15 15:45:56.034218', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (173, 49, NULL, NULL, 0, true, '2025-12-15 15:45:56.049866', '2025-12-15 15:45:56.049866', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (174, 49, NULL, NULL, 0, true, '2025-12-15 15:45:56.063384', '2025-12-15 15:45:56.063384', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (175, 49, NULL, NULL, 0, true, '2025-12-15 15:45:56.081761', '2025-12-15 15:45:56.081761', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (176, 49, NULL, NULL, 0, true, '2025-12-15 15:45:56.093608', '2025-12-15 15:45:56.093608', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (177, 50, NULL, NULL, 0, true, '2025-12-15 16:08:04.202821', '2025-12-15 16:08:04.202821', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (178, 50, NULL, NULL, 0, true, '2025-12-15 16:08:04.217961', '2025-12-15 16:08:04.217961', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (179, 50, NULL, NULL, 0, true, '2025-12-15 16:08:04.230303', '2025-12-15 16:08:04.230303', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (180, 50, NULL, NULL, 0, true, '2025-12-15 16:08:04.244698', '2025-12-15 16:08:04.244698', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (181, 50, NULL, NULL, 0, true, '2025-12-15 16:08:04.260082', '2025-12-15 16:08:04.260082', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (182, 50, NULL, NULL, 0, true, '2025-12-15 16:08:04.274703', '2025-12-15 16:08:04.274703', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (183, 50, NULL, NULL, 0, true, '2025-12-15 16:08:04.287837', '2025-12-15 16:08:04.287837', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (184, 51, NULL, NULL, 0, true, '2025-12-15 16:15:12.081279', '2025-12-15 16:15:12.081279', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (185, 51, NULL, NULL, 0, true, '2025-12-15 16:15:12.091726', '2025-12-15 16:15:12.091726', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (186, 51, NULL, NULL, 0, true, '2025-12-15 16:15:12.101391', '2025-12-15 16:15:12.101391', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (187, 51, NULL, NULL, 0, true, '2025-12-15 16:15:12.108922', '2025-12-15 16:15:12.108922', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (188, 51, NULL, NULL, 0, true, '2025-12-15 16:15:12.116199', '2025-12-15 16:15:12.116199', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (189, 51, NULL, NULL, 0, true, '2025-12-15 16:15:12.124684', '2025-12-15 16:15:12.124684', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (190, 51, NULL, NULL, 0, true, '2025-12-15 16:15:12.135689', '2025-12-15 16:15:12.135689', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (198, 53, NULL, NULL, 0, true, '2025-12-15 17:25:06.068785', '2025-12-15 17:25:06.068785', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (199, 53, NULL, NULL, 0, true, '2025-12-15 17:25:06.091019', '2025-12-15 17:25:06.091019', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (200, 53, NULL, NULL, 0, true, '2025-12-15 17:25:06.100993', '2025-12-15 17:25:06.100993', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (201, 53, NULL, NULL, 0, true, '2025-12-15 17:25:06.112634', '2025-12-15 17:25:06.112634', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (202, 53, NULL, NULL, 0, true, '2025-12-15 17:25:06.126288', '2025-12-15 17:25:06.126288', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (203, 53, NULL, NULL, 0, true, '2025-12-15 17:25:06.143703', '2025-12-15 17:25:06.143703', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (204, 53, NULL, NULL, 0, true, '2025-12-15 17:25:06.160333', '2025-12-15 17:25:06.160333', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (205, 54, NULL, NULL, 0, true, '2025-12-15 17:36:57.030734', '2025-12-15 17:36:57.030734', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (207, 54, NULL, NULL, 0, true, '2025-12-15 17:36:57.055211', '2025-12-15 17:36:57.055211', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (208, 54, NULL, NULL, 0, true, '2025-12-15 17:36:57.064924', '2025-12-15 17:36:57.064924', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (209, 54, NULL, NULL, 0, true, '2025-12-15 17:36:57.075515', '2025-12-15 17:36:57.075515', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (210, 54, NULL, NULL, 0, true, '2025-12-15 17:36:57.086308', '2025-12-15 17:36:57.086308', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (211, 54, NULL, NULL, 0, true, '2025-12-15 17:36:57.094877', '2025-12-15 17:36:57.094877', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (212, 55, NULL, NULL, 0, true, '2025-12-15 17:52:38.393327', '2025-12-15 17:52:38.393327', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (214, 55, NULL, NULL, 0, true, '2025-12-15 17:52:38.417028', '2025-12-15 17:52:38.417028', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (215, 55, NULL, NULL, 0, true, '2025-12-15 17:52:38.422628', '2025-12-15 17:52:38.422628', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (216, 55, NULL, NULL, 0, true, '2025-12-15 17:52:38.428997', '2025-12-15 17:52:38.428997', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (217, 55, NULL, NULL, 0, true, '2025-12-15 17:52:38.435006', '2025-12-15 17:52:38.435006', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (218, 55, NULL, NULL, 0, true, '2025-12-15 17:52:38.442634', '2025-12-15 17:52:38.442634', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (219, 56, NULL, NULL, 0, true, '2025-12-15 17:57:58.612395', '2025-12-15 17:57:58.612395', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (220, 56, NULL, NULL, 0, true, '2025-12-15 17:57:58.630232', '2025-12-15 17:57:58.630232', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (221, 56, NULL, NULL, 0, true, '2025-12-15 17:57:58.637059', '2025-12-15 17:57:58.637059', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (222, 56, NULL, NULL, 0, true, '2025-12-15 17:57:58.643829', '2025-12-15 17:57:58.643829', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (223, 56, NULL, NULL, 0, true, '2025-12-15 17:57:58.652901', '2025-12-15 17:57:58.652901', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (224, 56, NULL, NULL, 0, true, '2025-12-15 17:57:58.661654', '2025-12-15 17:57:58.661654', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (225, 56, NULL, NULL, 0, true, '2025-12-15 17:57:58.670322', '2025-12-15 17:57:58.670322', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (226, 57, NULL, NULL, 0, true, '2025-12-15 18:13:37.651746', '2025-12-15 18:13:37.651746', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (227, 57, NULL, NULL, 0, true, '2025-12-15 18:13:37.669834', '2025-12-15 18:13:37.669834', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (228, 57, NULL, NULL, 0, true, '2025-12-15 18:13:37.679197', '2025-12-15 18:13:37.679197', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (229, 57, NULL, NULL, 0, true, '2025-12-15 18:13:37.687793', '2025-12-15 18:13:37.687793', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (230, 57, NULL, NULL, 0, true, '2025-12-15 18:13:37.697565', '2025-12-15 18:13:37.697565', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (231, 57, NULL, NULL, 0, true, '2025-12-15 18:13:37.705088', '2025-12-15 18:13:37.705088', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (232, 57, NULL, NULL, 0, true, '2025-12-15 18:13:37.714061', '2025-12-15 18:13:37.714061', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (233, 58, NULL, NULL, 0, true, '2025-12-15 18:18:27.658509', '2025-12-15 18:18:27.658509', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (234, 58, NULL, NULL, 0, true, '2025-12-15 18:18:27.681517', '2025-12-15 18:18:27.681517', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (236, 58, NULL, NULL, 0, true, '2025-12-15 18:18:27.702625', '2025-12-15 18:18:27.702625', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (237, 58, NULL, NULL, 0, true, '2025-12-15 18:18:27.712941', '2025-12-15 18:18:27.712941', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (238, 58, NULL, NULL, 0, true, '2025-12-15 18:18:27.722817', '2025-12-15 18:18:27.722817', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (239, 58, NULL, NULL, 0, true, '2025-12-15 18:18:27.733717', '2025-12-15 18:18:27.733717', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (240, 59, NULL, NULL, 0, true, '2025-12-15 18:24:57.728668', '2025-12-15 18:24:57.728668', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (241, 59, NULL, NULL, 0, true, '2025-12-15 18:24:57.743764', '2025-12-15 18:24:57.743764', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (242, 59, NULL, NULL, 0, true, '2025-12-15 18:24:57.754133', '2025-12-15 18:24:57.754133', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (243, 59, NULL, NULL, 0, true, '2025-12-15 18:24:57.762621', '2025-12-15 18:24:57.762621', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (244, 59, NULL, NULL, 0, true, '2025-12-15 18:24:57.772157', '2025-12-15 18:24:57.772157', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (245, 59, NULL, NULL, 0, true, '2025-12-15 18:24:57.782845', '2025-12-15 18:24:57.782845', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (246, 59, NULL, NULL, 0, true, '2025-12-15 18:24:57.794667', '2025-12-15 18:24:57.794667', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (247, 60, NULL, NULL, 0, true, '2025-12-15 18:28:04.887072', '2025-12-15 18:28:04.887072', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (248, 60, NULL, NULL, 0, true, '2025-12-15 18:28:04.906661', '2025-12-15 18:28:04.906661', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (249, 60, NULL, NULL, 0, true, '2025-12-15 18:28:04.920634', '2025-12-15 18:28:04.920634', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (235, 58, NULL, NULL, 1, true, '2025-12-15 18:18:27.691725', '2026-01-23 19:55:42.054193', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (206, 54, NULL, NULL, 1, true, '2025-12-15 17:36:57.043392', '2026-01-23 20:00:41.901454', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (250, 60, NULL, NULL, 0, true, '2025-12-15 18:28:04.936679', '2025-12-15 18:28:04.936679', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (251, 60, NULL, NULL, 0, true, '2025-12-15 18:28:04.95026', '2025-12-15 18:28:04.95026', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (252, 60, NULL, NULL, 0, true, '2025-12-15 18:28:04.963006', '2025-12-15 18:28:04.963006', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (253, 60, NULL, NULL, 0, true, '2025-12-15 18:28:04.975796', '2025-12-15 18:28:04.975796', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (254, 61, NULL, NULL, 0, true, '2025-12-15 18:30:04.324503', '2025-12-15 18:30:04.324503', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (255, 61, NULL, NULL, 0, true, '2025-12-15 18:30:04.339034', '2025-12-15 18:30:04.339034', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (256, 61, NULL, NULL, 0, true, '2025-12-15 18:30:04.357426', '2025-12-15 18:30:04.357426', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (257, 61, NULL, NULL, 0, true, '2025-12-15 18:30:04.367995', '2025-12-15 18:30:04.367995', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (258, 61, NULL, NULL, 0, true, '2025-12-15 18:30:04.377069', '2025-12-15 18:30:04.377069', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (259, 61, NULL, NULL, 0, true, '2025-12-15 18:30:04.387684', '2025-12-15 18:30:04.387684', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (260, 61, NULL, NULL, 0, true, '2025-12-15 18:30:04.399187', '2025-12-15 18:30:04.399187', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (261, 87, NULL, NULL, 0, true, '2025-12-20 09:33:49.502938', '2025-12-20 09:33:49.502938', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (262, 87, NULL, NULL, 1, true, '2025-12-20 09:33:49.516785', '2025-12-20 09:33:49.516785', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (263, 87, NULL, NULL, 0, true, '2025-12-20 09:33:49.524354', '2025-12-20 09:33:49.524354', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (264, 87, NULL, NULL, 0, true, '2025-12-20 09:33:49.533364', '2025-12-20 09:33:49.533364', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (265, 87, NULL, NULL, 0, true, '2025-12-20 09:33:49.541239', '2025-12-20 09:33:49.541239', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (266, 87, NULL, NULL, 0, true, '2025-12-20 09:33:49.54794', '2025-12-20 09:33:49.54794', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (267, 87, NULL, NULL, 0, true, '2025-12-20 09:33:49.553796', '2025-12-20 09:33:49.553796', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (268, 93, NULL, NULL, 0, true, '2026-01-13 05:45:15.254921', '2026-01-13 05:45:15.254921', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (269, 93, NULL, NULL, 0, true, '2026-01-13 05:45:15.285629', '2026-01-13 05:45:15.285629', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (270, 93, NULL, NULL, 0, true, '2026-01-13 05:45:15.307453', '2026-01-13 05:45:15.307453', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (271, 93, NULL, NULL, 0, true, '2026-01-13 05:45:15.320254', '2026-01-13 05:45:15.320254', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (272, 93, NULL, NULL, 0, true, '2026-01-13 05:45:15.33321', '2026-01-13 05:45:15.33321', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (273, 93, NULL, NULL, 0, true, '2026-01-13 05:45:15.36973', '2026-01-13 05:45:15.36973', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (274, 93, NULL, NULL, 0, true, '2026-01-13 05:45:15.396719', '2026-01-13 05:45:15.396719', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (275, 94, NULL, NULL, 0, true, '2026-01-13 05:49:07.762492', '2026-01-13 05:49:07.762492', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (276, 94, NULL, NULL, 0, true, '2026-01-13 05:49:07.783155', '2026-01-13 05:49:07.783155', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (277, 94, NULL, NULL, 1, true, '2026-01-13 05:49:07.795461', '2026-01-13 05:49:07.795461', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (278, 94, NULL, NULL, 0, true, '2026-01-13 05:49:07.805488', '2026-01-13 05:49:07.805488', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (279, 94, NULL, NULL, 0, true, '2026-01-13 05:49:07.816937', '2026-01-13 05:49:07.816937', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (280, 94, NULL, NULL, 0, true, '2026-01-13 05:49:07.82925', '2026-01-13 05:49:07.82925', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (281, 94, NULL, NULL, 0, true, '2026-01-13 05:49:07.841746', '2026-01-13 05:49:07.841746', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (282, 106, NULL, NULL, 0, true, '2026-01-22 19:24:30.836162', '2026-01-22 19:24:30.836162', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (283, 106, NULL, NULL, 1, true, '2026-01-22 19:24:30.853843', '2026-01-22 19:24:30.853843', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (284, 106, NULL, NULL, 0, true, '2026-01-22 19:24:30.863751', '2026-01-22 19:24:30.863751', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (285, 106, NULL, NULL, 0, true, '2026-01-22 19:24:30.872505', '2026-01-22 19:24:30.872505', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (286, 106, NULL, NULL, 0, true, '2026-01-22 19:24:30.879286', '2026-01-22 19:24:30.879286', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (287, 106, NULL, NULL, 0, true, '2026-01-22 19:24:30.887065', '2026-01-22 19:24:30.887065', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (288, 106, NULL, NULL, 0, true, '2026-01-22 19:24:30.895059', '2026-01-22 19:24:30.895059', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (289, 107, NULL, NULL, 0, true, '2026-01-22 19:29:45.847617', '2026-01-22 19:29:45.847617', 1, 1, true, NULL);
INSERT INTO public.product_variants VALUES (290, 107, NULL, NULL, 1, true, '2026-01-22 19:29:45.861291', '2026-01-22 19:29:45.861291', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (291, 107, NULL, NULL, 0, true, '2026-01-22 19:29:45.870979', '2026-01-22 19:29:45.870979', 1, 3, true, NULL);
INSERT INTO public.product_variants VALUES (292, 107, NULL, NULL, 0, true, '2026-01-22 19:29:45.883729', '2026-01-22 19:29:45.883729', 1, 4, true, NULL);
INSERT INTO public.product_variants VALUES (293, 107, NULL, NULL, 0, true, '2026-01-22 19:29:45.896787', '2026-01-22 19:29:45.896787', 1, 5, true, NULL);
INSERT INTO public.product_variants VALUES (294, 107, NULL, NULL, 0, true, '2026-01-22 19:29:45.911693', '2026-01-22 19:29:45.911693', 1, 6, true, NULL);
INSERT INTO public.product_variants VALUES (295, 107, NULL, NULL, 0, true, '2026-01-22 19:29:45.923748', '2026-01-22 19:29:45.923748', 1, 7, true, NULL);
INSERT INTO public.product_variants VALUES (213, 55, NULL, NULL, 1, true, '2025-12-15 17:52:38.411302', '2026-01-23 19:55:16.404345', 1, 2, true, NULL);
INSERT INTO public.product_variants VALUES (123, 12, NULL, NULL, 1, true, '2025-12-14 04:38:33.340835', '2026-01-23 19:59:34.630193', 1, 3, true, NULL);


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.pages VALUES (2, 'Privacy Policy', 'سياسة الخصوصية', 'privacy-policy', '<h1 class="text-2xl font-bold text-gray-900 mb-4">PRIVACY POLICY</h1>
<p class="mb-4"><strong>Effective Date:</strong> 07 December 2025<br><strong>Merchant Name:</strong> VENÈ JEWELRY<br><strong>Country of Establishment:</strong> Lebanon</p>
<p class="mb-4">VENÈ JEWELRY ("VENÈ", "we", "us", "our") is committed to protecting the privacy and personal data of users, customers, and visitors ("Data Subjects"). This Privacy Policy explains how personal data is collected, used, stored, disclosed, protected, and processed when you interact with our website, services, or products.</p>
<p class="mb-4">This Privacy Policy forms an <strong>integral part of the Terms and Conditions</strong> and applies to all users of our services.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">1. PURPOSE OF THE PRIVACY POLICY</h2>
<p class="mb-4">This Privacy Policy aims to:</p>
<ul class="list-disc ml-6 mb-4">
<li>Ensure transparency regarding the processing of personal data</li>
<li>Define the rights of data subjects</li>
<li>Explain VENÈ JEWELRY''s data protection practices</li>
<li>Comply with applicable data protection, banking, and electronic commerce requirements</li>
</ul>
<p class="mb-4">By using our website or services, you acknowledge that you have read and understood this Privacy Policy.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">2. SCOPE OF APPLICATION</h2>
<p class="mb-4">This Privacy Policy applies to:</p>
<ul class="list-disc ml-6 mb-4">
<li>Website visitors</li>
<li>Customers placing orders</li>
<li>Individuals communicating with VENÈ JEWELRY</li>
<li>Users interacting through online payment platforms or customer support channels</li>
</ul>
<p class="mb-4">This policy applies regardless of the method of access (desktop, mobile, or other devices).</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">3. DEFINITIONS</h2>
<p class="mb-4">For the purposes of this Privacy Policy:</p>
<ul class="list-disc ml-6 mb-4">
<li><strong>Personal Data</strong> means any information relating to an identified or identifiable individual.</li>
<li><strong>Processing</strong> means any operation performed on personal data, including collection, storage, use, disclosure, or deletion.</li>
<li><strong>Data Subject</strong> means the individual to whom the personal data relates.</li>
</ul>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">4. PERSONAL DATA WE COLLECT</h2>
<p class="mb-4">VENÈ JEWELRY may collect and process the following categories of personal data:</p>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">4.1 Identification & Contact Data</h3>
<ul class="list-disc ml-6 mb-4">
<li>Full name</li>
<li>Email address</li>
<li>Phone number</li>
<li>Billing and shipping address</li>
</ul>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">4.2 Transaction & Financial Data</h3>
<ul class="list-disc ml-6 mb-4">
<li>Order details</li>
<li>Payment confirmation references</li>
<li>Transaction history (excluding card details)</li>
</ul>
<p class="mb-4">VENÈ JEWELRY <strong>does not store or process credit/debit card information</strong>.</p>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">4.3 Technical & Usage Data</h3>
<ul class="list-disc ml-6 mb-4">
<li>IP address</li>
<li>Device type and browser information</li>
<li>Date and time of access</li>
<li>Website interaction data (via cookies)</li>
</ul>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">4.4 Communication Data</h3>
<ul class="list-disc ml-6 mb-4">
<li>Customer inquiries</li>
<li>Emails, messages, and support communications</li>
<li>Feedback and complaints</li>
</ul>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">5. LEGAL BASIS FOR PROCESSING</h2>
<p class="mb-4">VENÈ JEWELRY processes personal data based on one or more of the following lawful grounds:</p>
<ul class="list-disc ml-6 mb-4">
<li><strong>Performance of a contract</strong> (order fulfilment and delivery)</li>
<li><strong>Legal obligations</strong> (accounting, tax, compliance, fraud prevention)</li>
<li><strong>Legitimate interests</strong> (business operations, service improvement, security)</li>
<li><strong>Consent</strong>, where required by applicable law</li>
</ul>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">6. PURPOSES OF PROCESSING</h2>
<p class="mb-4">Personal data is processed for the following purposes:</p>
<ul class="list-disc ml-6 mb-4">
<li>Processing and fulfilling orders</li>
<li>Managing payments and preventing fraud</li>
<li>Delivering products and services</li>
<li>Communicating order updates and support responses</li>
<li>Improving website functionality and customer experience</li>
<li>Complying with legal, regulatory, and banking requirements</li>
</ul>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">7. DATA SHARING & DISCLOSURE</h2>
<p class="mb-4">VENÈ JEWELRY may share personal data <strong>only when necessary</strong> with:</p>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">7.1 Service Providers</h3>
<ul class="list-disc ml-6 mb-4">
<li>Payment processing providers</li>
<li>Courier and logistics partners</li>
<li>IT, hosting, and website service providers</li>
</ul>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">7.2 Legal & Regulatory Authorities</h3>
<p class="mb-4">Personal data may be disclosed when required by:</p>
<ul class="list-disc ml-6 mb-4">
<li>Applicable laws</li>
<li>Court orders</li>
<li>Regulatory or governmental authorities</li>
<li>Compliance, sanctions, or fraud investigations</li>
</ul>
<p class="mb-4">VENÈ JEWELRY does <strong>not sell, rent, or trade</strong> personal data.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">8. INTERNATIONAL DATA TRANSFERS</h2>
<p class="mb-4">Due to the use of international service providers (e.g., payment gateways and hosting services), personal data may be transferred and processed outside the data subject''s country of residence.</p>
<p class="mb-4">VENÈ JEWELRY ensures that such transfers are conducted using <strong>appropriate safeguards</strong> and in accordance with applicable data protection laws.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">9. DATA RETENTION</h2>
<p class="mb-4">Personal data is retained only for the period necessary to:</p>
<ul class="list-disc ml-6 mb-4">
<li>Fulfill contractual obligations</li>
<li>Comply with legal and regulatory requirements</li>
<li>Resolve disputes</li>
<li>Enforce agreements</li>
</ul>
<p class="mb-4">Once retention is no longer required, data is <strong>securely deleted or anonymized</strong>.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">10. DATA SUBJECT RIGHTS</h2>
<p class="mb-4">Subject to applicable law, data subjects have the right to:</p>
<ul class="list-disc ml-6 mb-4">
<li>Request access to their personal data</li>
<li>Request correction of inaccurate or incomplete data</li>
<li>Request deletion where legally permitted</li>
<li>Object to or restrict processing</li>
<li>Withdraw consent where processing is based on consent</li>
</ul>
<p class="mb-4">Requests may be submitted using the contact details provided below.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">11. COOKIES & TRACKING TECHNOLOGIES</h2>
<p class="mb-4">VENÈ JEWELRY uses cookies and similar technologies to:</p>
<ul class="list-disc ml-6 mb-4">
<li>Enable website functionality</li>
<li>Analyse traffic and performance</li>
<li>Enhance user experience</li>
</ul>
<p class="mb-4">Users may disable cookies via browser settings; however, doing so may limit certain website features.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">12. DATA SECURITY MEASURES</h2>
<p class="mb-4">VENÈ JEWELRY implements appropriate technical and organizational measures to protect personal data against:</p>
<ul class="list-disc ml-6 mb-4">
<li>Unauthorized access</li>
<li>Loss, misuse, or alteration</li>
<li>Accidental or unlawful disclosure</li>
</ul>
<p class="mb-4">While we strive to protect personal data, <strong>no electronic transmission or storage system is completely secure</strong>, and absolute security cannot be guaranteed.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">13. PAYMENT PROCESSING DISCLAIMER</h2>
<p class="mb-4">All payments are processed through <strong>authorized third-party payment service providers</strong>.</p>
<p class="mb-4">VENÈ JEWELRY:</p>
<ul class="list-disc ml-6 mb-4">
<li>Does not access or store card details</li>
<li>Is not responsible for the internal security practices of payment providers</li>
<li>Relies on industry-standard encryption and security protocols used by such providers</li>
</ul>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">14. THIRD-PARTY LINKS</h2>
<p class="mb-4">Our website may contain links to third-party websites. VENÈ JEWELRY is <strong>not responsible</strong> for the privacy practices or content of external websites. Users are encouraged to review third-party privacy policies independently.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">15. POLICY UPDATES & MODIFICATIONS</h2>
<p class="mb-4">VENÈ JEWELRY reserves the right to amend this Privacy Policy at any time to reflect:</p>
<ul class="list-disc ml-6 mb-4">
<li>Legal or regulatory changes</li>
<li>Banking or payment gateway requirements</li>
<li>Operational or security needs</li>
</ul>
<p class="mb-4">The updated version shall become effective upon publication on the website.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">16. CONTACT INFORMATION</h2>
<p class="mb-4">For privacy-related inquiries or requests, please contact:</p>
<p class="mb-4"><strong>Email:</strong> venejewelry25@gmail.com<br><strong>Phone:</strong> +961 78 729 590</p>

<hr class="my-6">
<p class="text-center text-gray-600">© 2025 VENÈ JEWELRY™. All rights reserved.</p>
', 'تحترم فينيه سرية عملائها وتحمي جميع معلوماتهم الشخصية المُقدمة. تُستخدم هذه المعلومات فقط لتلبية الطلبات والتواصل والامتثال القانوني.

لا نبيع أو نتاجر أو نؤجر معلوماتك الشخصية لأطراف ثالثة. ومع ذلك، قد نشارك معلوماتك مع جهات خارجية موثوقة،</P> مثل:<p>

شركاء التوصيل لتلبية طلباتك وتوصيلها.
معالجو الدفع لمعالجة معاملاتك بأمان.
مقدمو الخدمات الذين يساعدوننا في تشغيل موقعنا الإلكتروني أو تحسين خدماتنا (مثل: مقدمو خدمات التحليلات).
الجهات القانونية عند الاقتضاء بموجب القانون أو لحماية حقوقنا وسلامتنا.', true, '2025-12-01 22:59:03.071696', '2026-01-06 21:25:10.844497');
INSERT INTO public.pages VALUES (1, 'Terms and Conditions', 'الشروط والأحكام', 'terms-and-conditions', '<h1 class="text-2xl font-bold text-gray-900 mb-4">TERMS & CONDITIONS (T&Cs)</h1>

<p class="mb-4"><strong>Effective Date:</strong> 07 December 2025<br>
<strong>Merchant Name:</strong> VENÈ JEWELRY<br>
<strong>Country of Establishment:</strong> Lebanon</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">1. LEGAL ACCEPTANCE & BINDING EFFECT</h2>
<p class="mb-4">By accessing, browsing, registering, or making any purchase through the VENÈ JEWELRY website, platform, social media channels, or payment interfaces (collectively, the "Platform"), you expressly confirm that:</p>
<ul class="list-disc ml-6 mb-4">
  <li>You are at least eighteen (18) years old;</li>
  <li>You possess full legal capacity to enter into binding contracts;</li>
  <li>You have read, understood, and accepted these Terms and Conditions in their entirety.</li>
</ul>
<p class="mb-4">Completion of any checkout, payment, or order confirmation constitutes <strong>electronic acceptance</strong> of these Terms and all referenced policies, which shall be legally binding and enforceable under applicable law.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">2. INTEGRATION OF POLICIES</h2>
<p class="mb-4">These Terms and Conditions incorporate by reference the following documents, each of which forms an <strong>integral part of the contractual relationship</strong>:</p>
<ul class="list-disc ml-6 mb-4">
  <li>Privacy Policy</li>
  <li>Refund & Cancellation Policy</li>
  <li>Delivery Policy</li>
</ul>
<p class="mb-4">In the event of any inconsistency, the provisions most protective of VENÈ JEWELRY shall prevail to the maximum extent permitted by law.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">3. BUSINESS DESCRIPTION & PRODUCT NATURE</h2>
<p class="mb-4">VENÈ JEWELRY operates as a fine jewelry designer and retailer specializing in:</p>
<ul class="list-disc ml-6 mb-4">
  <li>Ready-made jewelry collections</li>
  <li>Custom-made and bespoke jewelry</li>
  <li>Pre-order jewelry produced on demand</li>
</ul>
<p class="mb-4">Customers acknowledge and accept that:</p>
<ul class="list-disc ml-6 mb-4">
  <li>Jewelry products are handcrafted;</li>
  <li>Natural gemstones and precious metals inherently vary in colour, clarity, texture, and appearance;</li>
  <li>Minor variations do <strong>not</strong> constitute defects or non-conformity.</li>
</ul>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">4. ORDERS & ORDER ACCEPTANCE</h2>
<p class="mb-4">All orders placed through the Platform are <strong>subject to acceptance</strong> by VENÈ JEWELRY.</p>
<p class="mb-4">VENÈ JEWELRY reserves the right to:</p>
<ul class="list-disc ml-6 mb-4">
  <li>Reject or cancel any order at its discretion;</li>
  <li>Refuse service for compliance, fraud prevention, or legal reasons;</li>
  <li>Request additional verification prior to order acceptance.</li>
</ul>
<p class="mb-4">No order shall be deemed confirmed until payment is successfully authorized and acknowledged by VENÈ JEWELRY.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">5. CUSTOM & BESPOKE JEWELRY (STRICT TERMS)</h2>
<p class="mb-4">Custom and bespoke jewelry orders are governed by enhanced conditions due to their personalized nature:</p>
<ul class="list-disc ml-6 mb-4">
  <li>A <strong>non-refundable deposit of 30%</strong> is required prior to production;</li>
  <li>The remaining <strong>70% balance must be settled in full before delivery or collection</strong>;</li>
  <li>Once design approval is granted, the order becomes <strong>final, irreversible, and non-cancellable</strong>;</li>
  <li>No refunds, exchanges, or modifications are permitted after approval.</li>
</ul>
<p class="mb-4">Design visuals, CAD renders, sketches, or images are <strong>indicative representations only</strong> and do not guarantee exact replication.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">6. PRE-ORDER JEWELRY</h2>
<p class="mb-4">Pre-order items are manufactured exclusively upon confirmed customer payment.</p>
<p class="mb-4">Customers expressly acknowledge that:</p>
<ul class="list-disc ml-6 mb-4">
  <li>Full payment is required at the time of placing a pre-order;</li>
  <li>Delivery timelines are estimates only and may be affected by production or logistics;</li>
  <li>Pre-orders are <strong>non-cancellable and non-refundable</strong> once production begins.</li>
</ul>
<p class="mb-4">Refunds shall be issued <strong>only</strong> where VENÈ JEWELRY is unable to fulfill the order due to circumstances solely attributable to VENÈ.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">7. PRICING & TAXATION</h2>
<ul class="list-disc ml-6 mb-4">
  <li>All prices are displayed in <strong>USD</strong>, unless stated otherwise;</li>
  <li>Prices may change without prior notice;</li>
  <li>Taxes, customs duties, and import charges (if applicable) are the sole responsibility of the customer;</li>
  <li>Promotional pricing errors may result in order cancellation without liability.</li>
</ul>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">8. PAYMENTS & PAYMENT PROCESSING</h2>
<p class="mb-4">Payments are processed exclusively through authorized third-party payment service providers.</p>
<p class="mb-4">VENÈ JEWELRY:</p>
<ul class="list-disc ml-6 mb-4">
  <li>Does not store, process, or retain payment card data;</li>
  <li>Bears no liability for payment gateway failures, delays, or errors beyond its control;</li>
  <li>Reserves the right to suspend transactions suspected of fraud or abuse.</li>
</ul>
<p class="mb-4">Chargebacks initiated without first contacting VENÈ JEWELRY may result in account suspension and order refusal.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">9. DELIVERY & SHIPPING</h2>
<p class="mb-4">Delivery is governed by the <strong>Delivery Policy</strong>, which customers expressly accept.</p>
<p class="mb-4">Ownership and risk transfer to the customer upon confirmed delivery to the provided address.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">10. RETURNS, REFUNDS & CANCELLATIONS</h2>
<p class="mb-4">All matters relating to refunds and cancellations are governed exclusively by the <strong>Refund & Cancellation Policy</strong>.</p>
<p class="mb-4">No implied rights shall exist beyond those expressly stated.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">11. WARRANTY & LIMITATIONS</h2>
<p class="mb-4">VENÈ JEWELRY guarantees authenticity of materials.</p>
<p class="mb-4">Warranty coverage is strictly limited to:</p>
<ul class="list-disc ml-6 mb-4">
  <li>Manufacturing defects reported within <strong>seven (7) days</strong> of delivery.</li>
</ul>
<p class="mb-4">The following are excluded:</p>
<ul class="list-disc ml-6 mb-4">
  <li>Normal wear and tear;</li>
  <li>Improper use, accidents, or modifications;</li>
  <li>Third-party repairs or alterations.</li>
</ul>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">12. INTELLECTUAL PROPERTY</h2>
<p class="mb-4">All content, designs, images, concepts, logos, and trademarks are the exclusive intellectual property of VENÈ JEWELRY.</p>
<p class="mb-4">Unauthorized use, reproduction, resale, or imitation is strictly prohibited and may result in legal action.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">13. LIMITATION OF LIABILITY</h2>
<p class="mb-4">To the fullest extent permitted by law:</p>
<ul class="list-disc ml-6 mb-4">
  <li>VENÈ JEWELRY shall not be liable for indirect, incidental, consequential, or punitive damages;</li>
  <li>Total liability shall not exceed the <strong>amount paid for the specific product</strong> giving rise to the claim;</li>
  <li>Website use is entirely at the user''s own risk.</li>
</ul>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">14. RESTRICTED & PROHIBITED COUNTRIES</h2>
<p class="mb-4">VENÈ JEWELRY does not sell, ship, or provide services to:</p>
<ul class="list-disc ml-6 mb-4">
  <li>Sanctioned or restricted countries;</li>
  <li><strong>Israel</strong>.</li>
</ul>
<p class="mb-4">Orders associated with prohibited jurisdictions shall be automatically cancelled without liability.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">15. GOVERNING LAW & JURISDICTION</h2>
<p class="mb-4">These Terms are governed exclusively by the <strong>laws of Lebanon</strong>.</p>
<p class="mb-4">The courts of Lebanon shall have <strong>exclusive jurisdiction</strong>.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">16. CONTACT</h2>
<p class="mb-4">For general inquiries, please contact our Customer Service:</p>
<p class="mb-4"><strong>Email:</strong> venejewelry25@gmail.com<br>
<strong>Phone:</strong> +961 78 729 590</p>

<hr class="my-6">
<p class="text-center text-gray-600">© 2025 VENÈ JEWELRY™. All rights reserved.</p>
', '<h1 class="text-2xl font-bold text-gray-900 mb-4">الشروط والأحكام</h1>

<p class="mb-4"><strong>تاريخ السريان:</strong> 07 ديسمبر 2025<br>
<strong>اسم التاجر:</strong> VENÈ JEWELRY<br>
<strong>بلد التأسيس:</strong> لبنان</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">1. القبول القانوني والأثر الملزم</h2>
<p class="mb-4">من خلال الوصول إلى موقع VENÈ JEWELRY الإلكتروني أو منصاته أو قنوات التواصل الاجتماعي أو واجهات الدفع (يُشار إليها مجتمعة بـ "المنصة") أو تصفحها أو التسجيل فيها أو إجراء أي عملية شراء عبرها، فإنك تؤكد صراحةً ما يلي:</p>
<ul class="list-disc mr-6 mb-4">
  <li>أنك تبلغ من العمر ثمانية عشر (18) عامًا على الأقل;</li>
  <li>أنك تتمتع بالأهلية القانونية الكاملة لإبرام عقود ملزمة;</li>
  <li>أنك قد قرأت وفهمت وقبلت هذه الشروط والأحكام بالكامل.</li>
</ul>
<p class="mb-4">يُعدّ إتمام أي عملية دفع أو تأكيد طلب بمثابة <strong>قبول إلكتروني</strong> لهذه الشروط وجميع السياسات المشار إليها، ويكون ملزمًا قانونيًا وقابلًا للتنفيذ بموجب القانون المعمول به.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">2. دمج السياسات</h2>
<p class="mb-4">تتضمن هذه الشروط والأحكام بالإشارة الوثائق التالية، والتي يُشكّل كل منها <strong>جزءًا لا يتجزأ من العلاقة التعاقدية</strong>:</p>
<ul class="list-disc mr-6 mb-4">
  <li>سياسة الخصوصية</li>
  <li>سياسة الاسترداد والإلغاء</li>
  <li>سياسة التسليم</li>
</ul>
<p class="mb-4">في حالة وجود أي تعارض، تسود الأحكام الأكثر حمايةً لـ VENÈ JEWELRY إلى أقصى حد يسمح به القانون.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">3. وصف النشاط التجاري وطبيعة المنتجات</h2>
<p class="mb-4">تعمل VENÈ JEWELRY كمصممة وبائعة مجوهرات فاخرة متخصصة في:</p>
<ul class="list-disc mr-6 mb-4">
  <li>مجموعات المجوهرات الجاهزة</li>
  <li>المجوهرات المخصصة والمصنوعة حسب الطلب</li>
  <li>مجوهرات الطلب المسبق المُصنَّعة عند الطلب</li>
</ul>
<p class="mb-4">يُقرّ العملاء ويقبلون بأن:</p>
<ul class="list-disc mr-6 mb-4">
  <li>منتجات المجوهرات مصنوعة يدويًا;</li>
  <li>الأحجار الكريمة الطبيعية والمعادن الثمينة تتفاوت بطبيعتها في اللون والصفاء والملمس والمظهر;</li>
  <li>الاختلافات الطفيفة <strong>لا</strong> تُعدّ عيوبًا أو عدم مطابقة.</li>
</ul>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">4. الطلبات وقبول الطلبات</h2>
<p class="mb-4">تخضع جميع الطلبات المقدمة عبر المنصة <strong>لقبول</strong> VENÈ JEWELRY.</p>
<p class="mb-4">تحتفظ VENÈ JEWELRY بالحق في:</p>
<ul class="list-disc mr-6 mb-4">
  <li>رفض أو إلغاء أي طلب وفقًا لتقديرها;</li>
  <li>رفض تقديم الخدمة لأسباب تتعلق بالامتثال أو منع الاحتيال أو أسباب قانونية;</li>
  <li>طلب تحقق إضافي قبل قبول الطلب.</li>
</ul>
<p class="mb-4">لا يُعتبر أي طلب مؤكدًا حتى يتم اعتماد الدفع بنجاح والإقرار به من قبل VENÈ JEWELRY.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">5. المجوهرات المخصصة والمصنوعة حسب الطلب (شروط صارمة)</h2>
<p class="mb-4">تخضع طلبات المجوهرات المخصصة والمصنوعة حسب الطلب لشروط معززة نظرًا لطبيعتها الشخصية:</p>
<ul class="list-disc mr-6 mb-4">
  <li>يُشترط دفع <strong>عربون غير قابل للاسترداد بنسبة 30%</strong> قبل بدء الإنتاج;</li>
  <li>يجب تسوية <strong>الرصيد المتبقي البالغ 70% بالكامل قبل التسليم أو الاستلام</strong>;</li>
  <li>بمجرد الموافقة على التصميم، يصبح الطلب <strong>نهائيًا وغير قابل للتراجع أو الإلغاء</strong>;</li>
  <li>لا يُسمح بأي استرداد أو استبدال أو تعديل بعد الموافقة.</li>
</ul>
<p class="mb-4">تُعدّ الرسوم التوضيحية للتصميم والنماذج ثلاثية الأبعاد والرسومات أو الصور <strong>تمثيلات إرشادية فقط</strong> ولا تضمن النسخ المطابق.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">6. مجوهرات الطلب المسبق</h2>
<p class="mb-4">تُصنَّع عناصر الطلب المسبق حصريًا عند تأكيد دفع العميل.</p>
<p class="mb-4">يُقرّ العملاء صراحةً بأن:</p>
<ul class="list-disc mr-6 mb-4">
  <li>يجب الدفع الكامل عند تقديم الطلب المسبق;</li>
  <li>مواعيد التسليم هي تقديرات فقط وقد تتأثر بالإنتاج أو الخدمات اللوجستية;</li>
  <li>الطلبات المسبقة <strong>غير قابلة للإلغاء أو الاسترداد</strong> بمجرد بدء الإنتاج.</li>
</ul>
<p class="mb-4">يتم إصدار المبالغ المستردة <strong>فقط</strong> في حالة عدم قدرة VENÈ JEWELRY على تنفيذ الطلب لأسباب تُعزى حصريًا إلى VENÈ.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">7. التسعير والضرائب</h2>
<ul class="list-disc mr-6 mb-4">
  <li>تُعرض جميع الأسعار بـ<strong>الدولار الأمريكي</strong>، ما لم يُذكر خلاف ذلك;</li>
  <li>قد تتغير الأسعار دون إشعار مسبق;</li>
  <li>تقع الضرائب والرسوم الجمركية ورسوم الاستيراد (إن وُجدت) على عاتق العميل وحده;</li>
  <li>قد تؤدي الأخطاء في الأسعار الترويجية إلى إلغاء الطلب دون أي مسؤولية.</li>
</ul>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">8. المدفوعات ومعالجة الدفع</h2>
<p class="mb-4">تتم معالجة المدفوعات حصريًا من خلال مقدمي خدمات الدفع المعتمدين من أطراف ثالثة.</p>
<p class="mb-4">VENÈ JEWELRY:</p>
<ul class="list-disc mr-6 mb-4">
  <li>لا تخزّن أو تعالج أو تحتفظ ببيانات بطاقات الدفع;</li>
  <li>لا تتحمل أي مسؤولية عن أعطال بوابات الدفع أو التأخيرات أو الأخطاء الخارجة عن سيطرتها;</li>
  <li>تحتفظ بالحق في تعليق المعاملات المشتبه بأنها احتيالية أو مسيئة.</li>
</ul>
<p class="mb-4">قد يؤدي تقديم طلبات استرداد المبالغ المدفوعة (Chargebacks) دون التواصل أولًا مع VENÈ JEWELRY إلى تعليق الحساب ورفض الطلبات.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">9. التسليم والشحن</h2>
<p class="mb-4">يخضع التسليم <strong>لسياسة التسليم</strong> التي يقبلها العملاء صراحةً.</p>
<p class="mb-4">تنتقل الملكية والمخاطر إلى العميل عند تأكيد التسليم إلى العنوان المقدم.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">10. المرتجعات والمبالغ المستردة والإلغاءات</h2>
<p class="mb-4">تخضع جميع المسائل المتعلقة بالاسترداد والإلغاء حصريًا <strong>لسياسة الاسترداد والإلغاء</strong>.</p>
<p class="mb-4">لا توجد حقوق ضمنية تتجاوز تلك المنصوص عليها صراحةً.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">11. الضمان والقيود</h2>
<p class="mb-4">تضمن VENÈ JEWELRY أصالة المواد المستخدمة.</p>
<p class="mb-4">تقتصر تغطية الضمان بشكل صارم على:</p>
<ul class="list-disc mr-6 mb-4">
  <li>عيوب التصنيع المُبلَّغ عنها خلال <strong>سبعة (7) أيام</strong> من التسليم.</li>
</ul>
<p class="mb-4">يُستثنى ما يلي:</p>
<ul class="list-disc mr-6 mb-4">
  <li>التآكل والاستهلاك الطبيعي;</li>
  <li>الاستخدام غير السليم أو الحوادث أو التعديلات;</li>
  <li>الإصلاحات أو التعديلات من أطراف ثالثة.</li>
</ul>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">12. الملكية الفكرية</h2>
<p class="mb-4">جميع المحتويات والتصاميم والصور والمفاهيم والشعارات والعلامات التجارية هي ملكية فكرية حصرية لـ VENÈ JEWELRY.</p>
<p class="mb-4">يُحظر تمامًا الاستخدام أو النسخ أو إعادة البيع أو التقليد غير المصرح به، وقد يؤدي ذلك إلى اتخاذ إجراءات قانونية.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">13. تحديد المسؤولية</h2>
<p class="mb-4">إلى أقصى حد يسمح به القانون:</p>
<ul class="list-disc mr-6 mb-4">
  <li>لا تتحمل VENÈ JEWELRY المسؤولية عن الأضرار غير المباشرة أو العرضية أو التبعية أو العقابية;</li>
  <li>لا تتجاوز المسؤولية الإجمالية <strong>المبلغ المدفوع مقابل المنتج المحدد</strong> الذي نشأت عنه المطالبة;</li>
  <li>استخدام الموقع الإلكتروني يكون على مسؤولية المستخدم الخاصة بالكامل.</li>
</ul>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">14. الدول المقيدة والمحظورة</h2>
<p class="mb-4">لا تبيع VENÈ JEWELRY أو تشحن أو تقدم خدمات إلى:</p>
<ul class="list-disc mr-6 mb-4">
  <li>الدول الخاضعة للعقوبات أو المقيدة;</li>
  <li><strong>إسرائيل</strong>.</li>
</ul>
<p class="mb-4">يتم إلغاء الطلبات المرتبطة بالولايات القضائية المحظورة تلقائيًا دون أي مسؤولية.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">15. القانون الحاكم والاختصاص القضائي</h2>
<p class="mb-4">تخضع هذه الشروط حصريًا <strong>لقوانين لبنان</strong>.</p>
<p class="mb-4">تتمتع محاكم لبنان <strong>بالاختصاص القضائي الحصري</strong>.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">16. التواصل</h2>
<p class="mb-4">للاستفسارات العامة، يرجى التواصل مع خدمة العملاء:</p>
<p class="mb-4"><strong>البريد الإلكتروني:</strong> venejewelry25@gmail.com<br>
<strong>الهاتف:</strong> +961 78 729 590</p>

<hr class="my-6">
<p class="text-center text-gray-600">© 2025 VENÈ JEWELRY™. جميع الحقوق محفوظة.</p>
', true, '2025-12-01 22:59:03.044515', '2026-01-27 20:59:25.805618');
INSERT INTO public.pages VALUES (3, 'Refund & Cancellation Policy', 'سياسة الاسترجاع والإلغاء', 'refund-and-cancellation-policy', '<h1 class="text-2xl font-bold text-gray-900 mb-4">REFUND & CANCELLATION POLICY</h1>

<p class="mb-4"><strong>Effective Date:</strong> 07 December 2025<br>
<strong>Merchant:</strong> VENÈ JEWELRY<br>
<strong>Country of Establishment:</strong> Lebanon</p>

<p class="mb-4">This Refund & Cancellation Policy governs all matters relating to <strong>order cancellation, refunds, exchanges, reversals, and chargebacks</strong> for purchases made from VENÈ JEWELRY ("VENÈ", "we", "us", "our"). This policy forms an <strong>integral part of the Terms and Conditions</strong>.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">1. GENERAL PRINCIPLES</h2>
<p class="mb-4">Due to the nature of fine jewelry, bespoke craftsmanship, and made-to-order production, VENÈ JEWELRY applies <strong>strict refund and cancellation rules</strong>.</p>
<p class="mb-4">Customers expressly acknowledge and agree that:</p>
<ul class="list-disc ml-6 mb-4">
<li>Not all products are eligible for cancellation, refund, or exchange;</li>
<li>Eligibility depends on product category, production status, and legal requirements;</li>
<li>No implied rights exist beyond those expressly stated in this policy.</li>
</ul>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">2. NON-REFUNDABLE & NON-CANCELLABLE ITEMS</h2>
<p class="mb-4">The following items are <strong>strictly non-refundable and non-cancellable</strong>, without exception:</p>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">2.1 Custom-Made & Bespoke Jewelry</h3>
<ul class="list-disc ml-6 mb-4">
<li>Jewelry produced according to customer-approved specifications;</li>
<li>Items customized in size, design, metal, gemstone, engraving, or setting;</li>
<li>Orders for which production has commenced following design approval.</li>
</ul>
<p class="mb-4">Once design approval is granted and/or production begins:</p>
<ul class="list-disc ml-6 mb-4">
<li>The order becomes <strong>final and irreversible</strong>;</li>
<li><strong>No cancellation, refund, exchange, or modification</strong> shall be permitted.</li>
</ul>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">2.2 Pre-Order Jewelry</h3>
<ul class="list-disc ml-6 mb-4">
<li>Jewelry produced exclusively upon customer request;</li>
<li>Items not held in stock and manufactured on demand.</li>
</ul>
<p class="mb-4">Pre-order items:</p>
<ul class="list-disc ml-6 mb-4">
<li>Require <strong>full payment in advance</strong>;</li>
<li>Are <strong>non-refundable and non-cancellable</strong> once production is initiated.</li>
</ul>
<p class="mb-4">Refunds for pre-orders shall be issued <strong>only</strong> where VENÈ JEWELRY is unable to fulfill the order due to circumstances solely attributable to VENÈ.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">3. READY-MADE JEWELRY (LIMITED EXCHANGE ONLY)</h2>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">3.1 Exchange Eligibility</h3>
<p class="mb-4">Ready-made (non-custom, in-stock) jewelry may be eligible for <strong>exchange only</strong>, subject to all of the following conditions:</p>
<ul class="list-disc ml-6 mb-4">
<li>Exchange request submitted within <strong>seven (7) calendar days</strong> from confirmed delivery;</li>
<li>Item must be unused, unworn, undamaged, and unaltered;</li>
<li>Item must be returned in original packaging with all tags intact;</li>
<li>Item must pass inspection and verification by VENÈ JEWELRY.</li>
</ul>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">3.2 No Refunds for Ready-Made Items</h3>
<p class="mb-4">Unless required by applicable law:</p>
<ul class="list-disc ml-6 mb-4">
<li>Ready-made items are <strong>not eligible for refunds</strong>;</li>
<li>Exchanges are offered at VENÈ JEWELRY''s discretion and subject to availability.</li>
</ul>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">4. NON-REFUNDABLE COSTS</h2>
<p class="mb-4">The following costs are <strong>non-refundable under all circumstances</strong>, including approved exchanges or legally required refunds:</p>
<ul class="list-disc ml-6 mb-4">
<li>Shipping and handling fees</li>
<li>Customs duties, import taxes, VAT, or clearance charges</li>
<li>Payment processing fees imposed by third-party providers</li>
</ul>
<p class="mb-4">Customers acknowledge that such costs are external charges not controlled by VENÈ JEWELRY.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">5. ORDER CANCELLATIONS BY CUSTOMER</h2>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">5.1 Cancellations Not Permitted</h3>
<p class="mb-4">Customers <strong>may not cancel</strong>:</p>
<ul class="list-disc ml-6 mb-4">
<li>Custom-made or bespoke orders</li>
<li>Pre-order items</li>
<li>Orders already in production</li>
<li>Orders already dispatched</li>
</ul>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">5.2 Limited Cancellations (Ready-Made Items Only)</h3>
<p class="mb-4">Ready-made orders may be cancelled <strong>only if</strong>:</p>
<ul class="list-disc ml-6 mb-4">
<li>Cancellation request is submitted <strong>before dispatch</strong>, and</li>
<li>The order has not entered shipping or fulfilment processing.</li>
</ul>
<p class="mb-4">Approval of cancellation is subject to VENÈ JEWELRY''s confirmation.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">6. ORDER CANCELLATIONS BY VENÈ JEWELRY</h2>
<p class="mb-4">VENÈ JEWELRY reserves the right to cancel any order, without liability, in cases including but not limited to:</p>
<ul class="list-disc ml-6 mb-4">
<li>Payment authorization failure</li>
<li>Suspected fraud or abuse</li>
<li>Compliance, sanctions, or legal restrictions</li>
<li>Production or supply impossibility</li>
<li>Incorrect pricing or technical errors</li>
</ul>
<p class="mb-4">Where cancellation is initiated by VENÈ JEWELRY, a <strong>full refund of the product price paid</strong> shall be issued.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">7. REFUND PROCESSING (WHERE LEGALLY REQUIRED)</h2>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">7.1 Refund Method</h3>
<p class="mb-4">Approved refunds shall be:</p>
<ul class="list-disc ml-6 mb-4">
<li>Issued <strong>only to the original payment method</strong> used at checkout;</li>
<li>Processed in accordance with payment provider timelines.</li>
</ul>
<p class="mb-4">VENÈ JEWELRY shall not issue refunds via alternative methods (cash, bank transfer, store credit) unless required by law.</p>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">7.2 Processing Time</h3>
<p class="mb-4">Refund processing times may vary depending on:</p>
<ul class="list-disc ml-6 mb-4">
<li>Payment provider policies</li>
<li>Banking institutions</li>
<li>Currency conversion timelines</li>
</ul>
<p class="mb-4">VENÈ JEWELRY bears no liability for delays caused by third-party payment providers.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">8. CHARGEBACKS & PAYMENT DISPUTES</h2>
<p class="mb-4">Customers agree to:</p>
<ul class="list-disc ml-6 mb-4">
<li>Contact VENÈ JEWELRY first to resolve any order concerns;</li>
<li>Refrain from initiating chargebacks without reasonable cause.</li>
</ul>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">8.1 Unauthorized Chargebacks</h3>
<p class="mb-4">Chargebacks initiated:</p>
<ul class="list-disc ml-6 mb-4">
<li>In violation of this policy;</li>
<li>For non-refundable or non-cancellable items;</li>
<li>Without prior communication,</li>
</ul>
<p class="mb-4">may be:</p>
<ul class="list-disc ml-6 mb-4">
<li>Actively contested by VENÈ JEWELRY;</li>
<li>Reported to payment processors;</li>
<li>Used as grounds for order refusal or account restriction.</li>
</ul>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">9. ABUSE & FRAUD PREVENTION</h2>
<p class="mb-4">VENÈ JEWELRY reserves the right to:</p>
<ul class="list-disc ml-6 mb-4">
<li>Refuse future orders from customers engaging in abusive refund or chargeback behaviour;</li>
<li>Share relevant information with payment processors and fraud-prevention services.</li>
</ul>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">10. POLICY MODIFICATIONS</h2>
<p class="mb-4">VENÈ JEWELRY may amend this Refund & Cancellation Policy at any time to reflect:</p>
<ul class="list-disc ml-6 mb-4">
<li>Legal requirements</li>
<li>Bank or payment gateway rules</li>
<li>Operational considerations</li>
</ul>
<p class="mb-4">The version in effect at the time of purchase shall apply.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">11. CONTACT</h2>
<p class="mb-4">For refund or cancellation inquiries, please contact our Customer Service:</p>
<p class="mb-4"><strong>Email:</strong> venejewelry25@gmail.com<br>
<strong>Phone:</strong> +961 78 729 590</p>

<hr class="my-6">
<p class="text-center text-gray-600">© 2025 VENÈ JEWELRY™. All rights reserved.</p>', '<p>سيتم إبلاغكم بمواعيد الشحن عند تأكيد الطلب، وتستغرق مدة تصل إلى 15 يومًا للمجوهرات المتوفرة في المخزون، ومن 4 إلى 8 أسابيع للطلبات المخصصة.</p>
<p>&nbsp;</p>
<p>قد تختلف مواعيد التسليم باختلاف الموقع وجداول الإنتاج.</p>
<p>VEN&Egrave; غير مسؤولة عن أي تأخيرات ناجمة عن شركات الشحن أو الجمارك أو ظروف غير متوقعة (قوة قاهرة) خارجة عن سيطرتنا. جميع الشحنات مؤمنة حتى التسليم. يُرجى من العملاء فحص المنتجات فور استلامها. الإرجاع والاستبدال</p>
<p>نظرًا لطبيعة المجوهرات المخصصة، لا تُقبل عمليات الإرجاع أو الاستبدال للطلبات المخصصة.</p>
<p>يمكن إرجاع المجوهرات الجاهزة خلال 7 أيام من تاريخ الشراء فقط في حال وجود عيب تصنيعي مؤكد. يجب إرجاع المنتج بحالته الأصلية، غير مستخدم، مع جميع مواد التغليف والوثائق الأصلية سليمة.</p>', true, '2025-12-01 22:59:03.095874', '2026-01-06 21:27:36.328264');
INSERT INTO public.pages VALUES (4, 'Delivery Policy', 'سياسة التوصيل', 'delivery-policy', '<h1 class="text-2xl font-bold text-gray-900 mb-4">DELIVERY POLICY</h1>

<p class="mb-4"><strong>Effective Date:</strong> 07 December 2025<br>
<strong>Merchant:</strong> VENÈ JEWELRY<br>
<strong>Country of Establishment:</strong> Lebanon</p>

<p class="mb-4">This Delivery Policy governs all shipping, delivery, risk allocation, fees, and geographic restrictions applicable to purchases made from VENÈ JEWELRY ("VENÈ", "we", "us", "our").</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">1. DELIVERY COVERAGE</h2>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">1.1 Local Delivery</h3>
<p class="mb-4">VENÈ JEWELRY offers <strong>local delivery exclusively within the territory of Lebanon</strong>.</p>
<p class="mb-4">Local delivery availability, courier selection, and delivery timeframes may vary depending on location, security conditions, and logistics constraints.</p>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">1.2 International Delivery</h3>
<p class="mb-4">VENÈ JEWELRY offers <strong>international delivery to selected approved countries only</strong>, subject to:</p>
<ul class="list-disc ml-6 mb-4">
<li>Courier availability</li>
<li>Regulatory permissions</li>
<li>International trade, sanctions, and export-control laws</li>
<li>Internal compliance and risk assessment</li>
</ul>
<p class="mb-4">International delivery is <strong>not guaranteed</strong> for all countries and may be modified, restricted, or suspended at any time without prior notice.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">2. PROHIBITED & RESTRICTED COUNTRIES</h2>
<p class="mb-4">VENÈ JEWELRY does not deliver, ship, sell, or provide services to any country, territory, individual, or entity that is:</p>
<ul class="list-disc ml-6 mb-4">
<li>Subject to U.S. economic sanctions, export controls, or trade restrictions administered or enforced by:
  <ul class="list-circle ml-6 mt-2">
    <li>The U.S. Department of the Treasury (OFAC)</li>
    <li>The U.S. Department of Commerce</li>
  </ul>
</li>
<li>Subject to international sanctions, embargoes, or trade restrictions</li>
<li>Otherwise prohibited under applicable international banking or payment network rules</li>
</ul>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">2.1 Explicitly Prohibited Destinations Include (Non-Exhaustive List):</h3>
<ul class="list-disc ml-6 mb-4">
<li><strong>Israel</strong></li>
<li>Iran</li>
<li>North Korea</li>
<li>Cuba</li>
<li>Crimea, Donetsk, and Luhansk regions</li>
<li>Any country or region designated as sanctioned or restricted under U.S. law</li>
</ul>
<p class="mb-4">This list may be updated automatically to reflect changes in applicable sanctions regimes.</p>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">2.2 Compliance Screening</h3>
<p class="mb-4">VENÈ JEWELRY reserves the right to:</p>
<ul class="list-disc ml-6 mb-4">
<li>Block checkout access based on IP address, billing address, or shipping address</li>
<li>Cancel orders associated with restricted jurisdictions</li>
<li>Refuse delivery without liability where compliance risks are identified</li>
</ul>
<p class="mb-4">Any order placed in violation of this clause shall be <strong>automatically cancelled</strong>, and payments may be refunded or withheld where legally required.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">3. SHIPPING FEES</h2>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">3.1 Calculation of Fees</h3>
<p class="mb-4">Shipping fees are:</p>
<ul class="list-disc ml-6 mb-4">
<li>Calculated automatically at checkout</li>
<li>Based on destination, shipment value, weight, and courier selection</li>
<li>Displayed prior to payment confirmation</li>
</ul>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">3.2 Non-Refundable Fees</h3>
<p class="mb-4">All shipping and handling fees are <strong>non-refundable</strong>, except where:</p>
<ul class="list-disc ml-6 mb-4">
<li>Delivery failure is solely attributable to VENÈ JEWELRY, and</li>
<li>A refund is required by applicable law</li>
</ul>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">4. CUSTOMS, TAXES & IMPORT DUTIES</h2>
<p class="mb-4">For international deliveries:</p>
<ul class="list-disc ml-6 mb-4">
<li>Customs duties, import taxes, VAT, clearance fees, and other governmental charges are <strong>solely the customer''s responsibility</strong></li>
<li>VENÈ JEWELRY has <strong>no control over and no responsibility</strong> for such charges</li>
<li>Refusal to pay customs charges may result in shipment abandonment, return, or destruction without refund</li>
</ul>
<p class="mb-4">VENÈ JEWELRY shall not be liable for delays, losses, or additional costs arising from customs procedures.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">5. DELIVERY TIMEFRAMES</h2>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">5.1 Estimated Timelines</h3>
<p class="mb-4">Delivery timelines are <strong>estimates only</strong>, provided in good faith:</p>
<ul class="list-disc ml-6 mb-4">
<li><strong>In-stock items:</strong> up to <strong>15 business days</strong></li>
<li><strong>Custom or pre-order items:</strong> <strong>4–6 weeks</strong>, or as communicated</li>
</ul>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">5.2 No Guarantee</h3>
<p class="mb-4">Delivery times are <strong>not guaranteed</strong> and may be affected by:</p>
<ul class="list-disc ml-6 mb-4">
<li>Courier delays</li>
<li>Customs clearance</li>
<li>Force majeure events</li>
<li>Regulatory inspections</li>
<li>Security or logistical disruptions</li>
</ul>
<p class="mb-4">VENÈ JEWELRY shall not be liable for delays beyond its reasonable control.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">6. ADDRESS ACCURACY & DELIVERY FAILURE</h2>
<p class="mb-4">Customers are solely responsible for:</p>
<ul class="list-disc ml-6 mb-4">
<li>Providing accurate and complete delivery information</li>
<li>Ensuring availability to receive shipments</li>
</ul>
<p class="mb-4">VENÈ JEWELRY is <strong>not liable</strong> for:</p>
<ul class="list-disc ml-6 mb-4">
<li>Failed deliveries due to incorrect addresses</li>
<li>Missed delivery attempts</li>
<li>Delays caused by customer unavailability</li>
</ul>
<p class="mb-4">Additional shipping or re-delivery costs shall be borne by the customer.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">7. TRANSFER OF RISK & OWNERSHIP</h2>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">7.1 Risk Transfer</h3>
<p class="mb-4">Risk of loss, damage, or delay <strong>passes to the customer upon confirmed delivery</strong> to the shipping address provided.</p>

<h3 class="text-lg font-semibold text-gray-900 mt-4 mb-2">7.2 Inspection Obligation</h3>
<p class="mb-4">Customers must:</p>
<ul class="list-disc ml-6 mb-4">
<li>Inspect shipments immediately upon receipt</li>
<li>Report visible damage or discrepancies within <strong>seven (7) days</strong> of delivery</li>
</ul>
<p class="mb-4">Failure to report within this period constitutes acceptance of the delivery.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">8. FORCE MAJEURE</h2>
<p class="mb-4">VENÈ JEWELRY shall not be liable for failure or delay in delivery caused by events beyond reasonable control, including but not limited to:</p>
<ul class="list-disc ml-6 mb-4">
<li>Natural disasters</li>
<li>Armed conflict</li>
<li>Governmental actions</li>
<li>Sanctions or regulatory changes</li>
<li>Courier service interruptions</li>
</ul>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">9. RIGHT TO MODIFY DELIVERY POLICY</h2>
<p class="mb-4">VENÈ JEWELRY reserves the right to amend this Delivery Policy at any time to reflect:</p>
<ul class="list-disc ml-6 mb-4">
<li>Changes in law</li>
<li>Banking or payment gateway requirements</li>
<li>Operational or security considerations</li>
</ul>
<p class="mb-4">Updated versions shall apply to all orders placed after the effective date.</p>

<h2 class="text-xl font-bold text-gray-900 mt-6 mb-3">10. CONTACT</h2>
<p class="mb-4">For delivery-related inquiries, please contact our Customer Service:</p>
<p class="mb-4"><strong>Email:</strong> venejewelry25@gmail.com<br>
<strong>Phone:</strong> +961 78 729 590</p>

<hr class="my-6">
<p class="text-center text-gray-600">© 2025 VENÈ JEWELRY™. All rights reserved.</p>', NULL, true, '2026-01-06 21:15:56.930286', '2026-01-06 21:29:56.465936');


--
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.product_images VALUES (9, 2, '4.jpeg', 2, '2025-12-02 12:58:23.217995', '2025-12-02 12:58:23.217995');
INSERT INTO public.product_images VALUES (10, 2, '3.jpeg', 4, '2025-12-02 12:58:35.765946', '2025-12-02 12:58:35.765946');
INSERT INTO public.product_images VALUES (13, 2, '2.jpeg', 6, '2025-12-02 12:59:23.887575', '2025-12-02 12:59:23.887575');
INSERT INTO public.product_images VALUES (14, 2, '1.jpeg', 8, '2025-12-02 12:59:31.878453', '2025-12-02 12:59:31.878453');
INSERT INTO public.product_images VALUES (16, 4, 'WG_Evergreen_crown_ring_top_view.jpeg', 2, '2025-12-08 12:59:11.276509', '2025-12-08 12:59:11.276509');
INSERT INTO public.product_images VALUES (17, 4, 'WG_Evergreen_crown_ring_front_view.jpeg', 3, '2025-12-08 12:59:11.692733', '2025-12-08 12:59:11.692733');
INSERT INTO public.product_images VALUES (18, 4, 'WG_Evergreen_crown_ring_side_view.jpeg', 4, '2025-12-08 12:59:12.093927', '2025-12-08 12:59:12.093927');
INSERT INTO public.product_images VALUES (19, 4, 'WG_Evergreen_crown_ring_angle_view.jpeg', 5, '2025-12-08 12:59:12.511377', '2025-12-08 12:59:12.511377');
INSERT INTO public.product_images VALUES (20, 5, 'YG_Evergreen_crown_ring_top_view.jpeg', 2, '2025-12-08 16:15:54.077075', '2025-12-08 16:15:54.077075');
INSERT INTO public.product_images VALUES (21, 6, 'RG_Blush_Promise_Ring.jpeg', 2, '2025-12-08 16:38:11.50272', '2025-12-08 16:38:11.50272');
INSERT INTO public.product_images VALUES (22, 6, 'RG_Blush_Promise_Ring_front_view.jpeg', 3, '2025-12-08 16:38:12.019996', '2025-12-08 16:38:12.019996');
INSERT INTO public.product_images VALUES (23, 6, 'RG_Blush_Promise_Ring_side_view.jpeg', 4, '2025-12-08 16:38:12.503802', '2025-12-08 16:38:12.503802');
INSERT INTO public.product_images VALUES (24, 6, 'RG_Blush_Promise_Ring_angle_view.jpeg', 5, '2025-12-08 16:38:12.894481', '2025-12-08 16:38:12.894481');
INSERT INTO public.product_images VALUES (25, 7, 'WG_Blush_Promise_Ring.jpeg', 2, '2025-12-08 16:43:28.485637', '2025-12-08 16:43:28.485637');
INSERT INTO public.product_images VALUES (26, 7, 'WG_Blush_Promise_Ring_front_view.jpeg', 3, '2025-12-08 16:43:28.815637', '2025-12-08 16:43:28.815637');
INSERT INTO public.product_images VALUES (27, 7, 'WG_Blush_Promise_Ring_side_view.jpeg', 4, '2025-12-08 16:43:29.180494', '2025-12-08 16:43:29.180494');
INSERT INTO public.product_images VALUES (28, 7, 'WG_Blush_Promise_Ring_angle_view.jpeg', 5, '2025-12-08 16:43:29.556345', '2025-12-08 16:43:29.556345');
INSERT INTO public.product_images VALUES (29, 8, 'YG_Blush_Promise_Ring.jpeg', 2, '2025-12-08 16:53:31.39068', '2025-12-08 16:53:31.39068');
INSERT INTO public.product_images VALUES (30, 8, 'YG_Blush_Promise_Ring_front_view.jpeg', 3, '2025-12-08 16:53:32.229622', '2025-12-08 16:53:32.229622');
INSERT INTO public.product_images VALUES (31, 8, 'YG_Blush_Promise_Ring_side_view.jpeg', 4, '2025-12-08 16:53:32.693961', '2025-12-08 16:53:32.693961');
INSERT INTO public.product_images VALUES (32, 8, 'YG_Blush_Promise_Ring_angle_view.jpeg', 5, '2025-12-08 16:53:33.276827', '2025-12-08 16:53:33.276827');
INSERT INTO public.product_images VALUES (33, 9, 'WG_Flower_yellow_stone_pendant_front_view.jpeg', 2, '2025-12-08 17:03:35.42023', '2025-12-08 17:03:35.42023');
INSERT INTO public.product_images VALUES (34, 9, 'WG_flower_yellow_pendant_angle_view.jpeg', 3, '2025-12-08 17:03:35.783718', '2025-12-08 17:03:35.783718');
INSERT INTO public.product_images VALUES (35, 9, 'WG_flower_yellow_stone_pendant_side_view.jpeg', 4, '2025-12-08 17:03:36.144263', '2025-12-08 17:03:36.144263');
INSERT INTO public.product_images VALUES (36, 9, 'WG_flower_yellow_stone_pendant_back_view.jpeg', 5, '2025-12-08 17:03:36.486702', '2025-12-08 17:03:36.486702');
INSERT INTO public.product_images VALUES (37, 10, 'WG_ocean_light_necklace_front_view.jpeg', 2, '2025-12-08 17:30:44.378793', '2025-12-08 17:30:44.378793');
INSERT INTO public.product_images VALUES (38, 10, 'WG_ocean_light_necklace_angle_view.jpeg', 3, '2025-12-08 17:30:44.71303', '2025-12-08 17:30:44.71303');
INSERT INTO public.product_images VALUES (39, 10, 'WG_ocean_light_necklace_side_view.jpeg', 4, '2025-12-08 17:30:45.089378', '2025-12-08 17:30:45.089378');
INSERT INTO public.product_images VALUES (40, 10, 'WG_ocean_light_necklace_back_view.jpeg', 5, '2025-12-08 17:30:45.440523', '2025-12-08 17:30:45.440523');
INSERT INTO public.product_images VALUES (41, 11, 'YG_Vetra_ring.png', 2, '2025-12-09 05:50:47.368123', '2025-12-09 05:50:47.368123');
INSERT INTO public.product_images VALUES (42, 11, 'YG_Vetra_ring_front_view.jpeg', 3, '2025-12-09 05:50:47.692051', '2025-12-09 05:50:47.692051');
INSERT INTO public.product_images VALUES (43, 11, 'YG_Vetra_ring_side_view.png', 4, '2025-12-09 05:50:48.438455', '2025-12-09 05:50:48.438455');
INSERT INTO public.product_images VALUES (44, 11, 'YG_Vetra_ring_angle_view.jpeg', 5, '2025-12-09 05:50:48.797686', '2025-12-09 05:50:48.797686');
INSERT INTO public.product_images VALUES (45, 12, 'WG_Vetra_ring.png', 2, '2025-12-09 06:07:24.617852', '2025-12-09 06:07:24.617852');
INSERT INTO public.product_images VALUES (46, 12, 'WG_Vetra_ring_side_view.png', 3, '2025-12-09 06:07:25.440806', '2025-12-09 06:07:25.440806');
INSERT INTO public.product_images VALUES (47, 12, 'WG_Vetra_ring_front_view.jpeg', 5, '2025-12-09 06:07:26.420474', '2025-12-09 06:07:26.420474');
INSERT INTO public.product_images VALUES (48, 12, 'WG_Vetra_ring_angle_view.jpeg', 6, '2025-12-09 06:07:26.760337', '2025-12-09 06:07:26.760337');
INSERT INTO public.product_images VALUES (49, 13, 'RG_Love_Harmony_Ring.jpeg', 2, '2025-12-09 11:45:34.992529', '2025-12-09 11:45:34.992529');
INSERT INTO public.product_images VALUES (50, 13, 'RG_Love_Harmony_Ring_angle_view1.jpeg', 3, '2025-12-09 11:45:35.369319', '2025-12-09 11:45:35.369319');
INSERT INTO public.product_images VALUES (51, 13, 'RG_Love_Harmony_Ring_side_view.jpeg', 4, '2025-12-09 11:45:35.736928', '2025-12-09 11:45:35.736928');
INSERT INTO public.product_images VALUES (52, 13, 'RG_Love_Harmony_Ring_front_view.jpeg', 5, '2025-12-09 11:45:36.212616', '2025-12-09 11:45:36.212616');
INSERT INTO public.product_images VALUES (53, 14, 'YG_Vetra_ring.png', 2, '2025-12-09 11:52:59.694563', '2025-12-09 11:52:59.694563');
INSERT INTO public.product_images VALUES (54, 14, 'YG_Vetra_ring_angle_view.jpeg', 3, '2025-12-09 11:53:00.305802', '2025-12-09 11:53:00.305802');
INSERT INTO public.product_images VALUES (55, 14, 'YG_Vetra_ring_side_view.png', 4, '2025-12-09 11:53:01.320952', '2025-12-09 11:53:01.320952');
INSERT INTO public.product_images VALUES (56, 14, 'YG_Vetra_ring_front_view.jpeg', 5, '2025-12-09 11:53:02.241073', '2025-12-09 11:53:02.241073');
INSERT INTO public.product_images VALUES (57, 15, 'WG_Vetra_ring.png', 2, '2025-12-09 12:03:48.372941', '2025-12-09 12:03:48.372941');
INSERT INTO public.product_images VALUES (58, 15, 'WG_Vetra_ring_front_view.jpeg', 3, '2025-12-09 12:03:48.796486', '2025-12-09 12:03:48.796486');
INSERT INTO public.product_images VALUES (59, 15, 'WG_Vetra_ring_side_view.png', 4, '2025-12-09 12:03:49.807855', '2025-12-09 12:03:49.807855');
INSERT INTO public.product_images VALUES (60, 15, 'WG_Vetra_ring_angle_view.jpeg', 5, '2025-12-09 12:03:50.218638', '2025-12-09 12:03:50.218638');
INSERT INTO public.product_images VALUES (61, 16, 'RG_VETRA_RING.png', 2, '2025-12-09 12:05:59.11764', '2025-12-09 12:05:59.11764');
INSERT INTO public.product_images VALUES (62, 16, 'RG_VETRA_ring_front_view.jpeg', 3, '2025-12-09 12:05:59.853646', '2025-12-09 12:05:59.853646');
INSERT INTO public.product_images VALUES (63, 16, 'RG_VETRA_RING_side_view.png', 4, '2025-12-09 12:06:00.821214', '2025-12-09 12:06:00.821214');
INSERT INTO public.product_images VALUES (64, 16, 'RG_VETRA_RING_angle_view.jpeg', 5, '2025-12-09 12:06:01.254001', '2025-12-09 12:06:01.254001');
INSERT INTO public.product_images VALUES (65, 17, 'RG_VETRA_RING.png', 2, '2025-12-09 12:08:05.014688', '2025-12-09 12:08:05.014688');
INSERT INTO public.product_images VALUES (66, 17, 'RG_VETRA_ring_front_view.jpeg', 3, '2025-12-09 12:08:05.744964', '2025-12-09 12:08:05.744964');
INSERT INTO public.product_images VALUES (67, 17, 'RG_VETRA_RING_side_view.png', 4, '2025-12-09 12:08:06.740543', '2025-12-09 12:08:06.740543');
INSERT INTO public.product_images VALUES (68, 17, 'RG_VETRA_RING_angle_view.jpeg', 5, '2025-12-09 12:08:07.177051', '2025-12-09 12:08:07.177051');
INSERT INTO public.product_images VALUES (69, 18, 'WG_Love_Harmony_Ring.jpeg', 2, '2025-12-09 12:19:30.527593', '2025-12-09 12:19:30.527593');
INSERT INTO public.product_images VALUES (70, 18, 'WG_Love_Harmony_Ring_front_view.jpeg', 3, '2025-12-09 12:19:30.886772', '2025-12-09 12:19:30.886772');
INSERT INTO public.product_images VALUES (71, 18, 'WG_Love_Harmony_Ring_side_view.jpeg', 4, '2025-12-09 12:19:31.264654', '2025-12-09 12:19:31.264654');
INSERT INTO public.product_images VALUES (72, 18, 'WG_Love_Harmony_angle_view_1.jpeg', 5, '2025-12-09 12:19:31.62545', '2025-12-09 12:19:31.62545');
INSERT INTO public.product_images VALUES (85, 21, 'YG_Love_Harmony_Ring.jpeg', 2, '2025-12-09 13:08:03.188356', '2025-12-09 13:08:03.188356');
INSERT INTO public.product_images VALUES (86, 21, 'YG_Love_Harmony_Ring_front_view.jpeg', 3, '2025-12-09 13:08:03.607032', '2025-12-09 13:08:03.607032');
INSERT INTO public.product_images VALUES (87, 21, 'YG_Love_Harmony_angle_view_1.jpeg', 4, '2025-12-09 13:08:04.041614', '2025-12-09 13:08:04.041614');
INSERT INTO public.product_images VALUES (88, 21, 'YG_Love_Harmony_Ring_side_view.jpeg', 5, '2025-12-09 13:08:04.405318', '2025-12-09 13:08:04.405318');
INSERT INTO public.product_images VALUES (89, 22, 'Square_Necklace.JPG', 2, '2025-12-09 13:20:48.731636', '2025-12-09 13:20:48.731636');
INSERT INTO public.product_images VALUES (90, 22, 'square_standing_necklace.JPG', 3, '2025-12-09 13:20:49.242742', '2025-12-09 13:20:49.242742');
INSERT INTO public.product_images VALUES (93, 23, 'RG_Peach_Morganite_Ring.jpeg', 4, '2025-12-10 05:29:37.620138', '2025-12-10 05:29:37.620138');
INSERT INTO public.product_images VALUES (94, 23, 'RG_Ring_Peach_Morganite_side_view.jpeg', 5, '2025-12-10 05:29:38.029099', '2025-12-10 05:29:38.029099');
INSERT INTO public.product_images VALUES (96, 24, 'YG_Peach_Morganite_.jpeg', 2, '2025-12-10 05:34:46.876326', '2025-12-10 05:34:46.876326');
INSERT INTO public.product_images VALUES (97, 24, 'YG_Peach_Morganite_angle_view.jpeg', 3, '2025-12-10 05:34:47.423577', '2025-12-10 05:34:47.423577');
INSERT INTO public.product_images VALUES (98, 24, 'YG_Ring_Peach_Morganite_side_view.jpeg', 4, '2025-12-10 05:34:47.754643', '2025-12-10 05:34:47.754643');
INSERT INTO public.product_images VALUES (99, 24, 'YG_Ring_Peach_Morganite_front_view.jpeg', 5, '2025-12-10 05:34:48.137287', '2025-12-10 05:34:48.137287');
INSERT INTO public.product_images VALUES (100, 25, 'WG_Peach_Morganite_.jpeg', 2, '2025-12-10 05:41:38.7658', '2025-12-10 05:41:38.7658');
INSERT INTO public.product_images VALUES (101, 25, 'WG_Peach_Morganite_angle_view.jpeg', 3, '2025-12-10 05:41:39.087478', '2025-12-10 05:41:39.087478');
INSERT INTO public.product_images VALUES (102, 25, 'WG_ring_peach_morganite_side_view.jpeg', 4, '2025-12-10 05:41:39.434117', '2025-12-10 05:41:39.434117');
INSERT INTO public.product_images VALUES (103, 25, 'WG_ring_peach_morganite_front_view.jpeg', 5, '2025-12-10 05:41:39.790241', '2025-12-10 05:41:39.790241');
INSERT INTO public.product_images VALUES (104, 26, 'RG_Candy_Bracelet.jpeg', 2, '2025-12-12 18:40:38.808763', '2025-12-12 18:40:38.808763');
INSERT INTO public.product_images VALUES (105, 26, 'RG_Candy_Bracelet_full.jpeg', 3, '2025-12-12 18:40:39.622953', '2025-12-12 18:40:39.622953');
INSERT INTO public.product_images VALUES (106, 26, 'RG_Candy_Bracelet_Vene_diamond_shape.jpeg', 4, '2025-12-12 18:40:40.530285', '2025-12-12 18:40:40.530285');
INSERT INTO public.product_images VALUES (107, 27, 'YG_Candy_Bracelet.jpeg', 2, '2025-12-12 18:45:47.850024', '2025-12-12 18:45:47.850024');
INSERT INTO public.product_images VALUES (108, 27, 'YG_Candy_Bracelet_full.jpeg', 3, '2025-12-12 18:45:48.254807', '2025-12-12 18:45:48.254807');
INSERT INTO public.product_images VALUES (109, 27, 'YG_Candy_Bracelet_Vene_diamond_shape.jpeg', 4, '2025-12-12 18:45:48.820303', '2025-12-12 18:45:48.820303');
INSERT INTO public.product_images VALUES (110, 28, 'WG_Candy_Bracelet.jpeg', 2, '2025-12-12 19:22:51.339299', '2025-12-12 19:22:51.339299');
INSERT INTO public.product_images VALUES (111, 28, 'WG_Candy_Bracelet_full.jpeg', 3, '2025-12-12 19:22:51.750768', '2025-12-12 19:22:51.750768');
INSERT INTO public.product_images VALUES (112, 28, 'WG_Candy_Bracelet_Vene_diamond_shape.jpeg', 4, '2025-12-12 19:22:52.158226', '2025-12-12 19:22:52.158226');
INSERT INTO public.product_images VALUES (114, 29, 'YG_Peach_Morganite_.jpeg', 2, '2025-12-13 07:16:17.316075', '2025-12-13 07:16:17.316075');
INSERT INTO public.product_images VALUES (115, 29, 'YG_Ring_Peach_Morganite_front_view.jpeg', 3, '2025-12-13 07:16:17.680546', '2025-12-13 07:16:17.680546');
INSERT INTO public.product_images VALUES (116, 29, 'YG_Peach_Morganite_angle_view.jpeg', 4, '2025-12-13 07:16:18.176669', '2025-12-13 07:16:18.176669');
INSERT INTO public.product_images VALUES (117, 29, 'YG_Ring_Peach_Morganite_side_view.jpeg', 5, '2025-12-13 07:16:18.565205', '2025-12-13 07:16:18.565205');
INSERT INTO public.product_images VALUES (118, 30, 'Majesty_in_Violet_Ring.JPG', 2, '2025-12-13 09:05:32.305873', '2025-12-13 09:05:32.305873');
INSERT INTO public.product_images VALUES (119, 30, 'Majesty_in_Violet_2_hands.JPG', 3, '2025-12-13 09:05:32.653523', '2025-12-13 09:05:32.653523');
INSERT INTO public.product_images VALUES (120, 30, 'Majesty_in_Violet_-hand_pic.PNG', 4, '2025-12-13 09:05:34.295482', '2025-12-13 09:05:34.295482');
INSERT INTO public.product_images VALUES (121, 31, 'RG_Hearts_Bracelet.jpeg', 2, '2025-12-14 05:48:03.01694', '2025-12-14 05:48:03.01694');
INSERT INTO public.product_images VALUES (122, 31, 'RG_Hearts_Bracelet_full.jpeg', 3, '2025-12-14 05:48:03.513135', '2025-12-14 05:48:03.513135');
INSERT INTO public.product_images VALUES (123, 31, 'RG_Hearts_Bracelet_back_view.jpeg', 4, '2025-12-14 05:48:04.03762', '2025-12-14 05:48:04.03762');
INSERT INTO public.product_images VALUES (124, 31, 'RG_Hearts_Bracelet_Diamond_shape.jpeg', 5, '2025-12-14 05:48:04.461538', '2025-12-14 05:48:04.461538');
INSERT INTO public.product_images VALUES (125, 32, 'YG_Hearts_Breaclet.jpeg', 2, '2025-12-14 07:36:00.434011', '2025-12-14 07:36:00.434011');
INSERT INTO public.product_images VALUES (126, 32, 'YG_Hearts_Breaclet_full.jpeg', 3, '2025-12-14 07:36:00.750572', '2025-12-14 07:36:00.750572');
INSERT INTO public.product_images VALUES (127, 32, 'YG_Hearts_Breaclet_back_view.jpeg', 4, '2025-12-14 07:36:01.092894', '2025-12-14 07:36:01.092894');
INSERT INTO public.product_images VALUES (128, 32, 'YG_Hearts_Bracelet_diamond_shape.jpeg', 5, '2025-12-14 07:36:01.466135', '2025-12-14 07:36:01.466135');
INSERT INTO public.product_images VALUES (129, 33, 'WG_Hearts_Bracelet_Chain.jpeg', 2, '2025-12-14 07:42:23.722592', '2025-12-14 07:42:23.722592');
INSERT INTO public.product_images VALUES (130, 33, 'WG_Hearts_Bracelet_Chain_full.jpeg', 3, '2025-12-14 07:42:24.056928', '2025-12-14 07:42:24.056928');
INSERT INTO public.product_images VALUES (131, 33, 'WG_Hearts_Breaclet_back_view.jpeg', 4, '2025-12-14 07:42:24.390686', '2025-12-14 07:42:24.390686');
INSERT INTO public.product_images VALUES (132, 33, 'WG_Hearts_Bracelet_Chain_diamond_chape.jpeg', 5, '2025-12-14 07:42:24.734253', '2025-12-14 07:42:24.734253');
INSERT INTO public.product_images VALUES (133, 34, 'RG_Hearts_Braclet_2.jpeg', 2, '2025-12-14 07:52:14.159756', '2025-12-14 07:52:14.159756');
INSERT INTO public.product_images VALUES (134, 34, 'RG_Hearts_Braclet_2_back_view.jpeg', 3, '2025-12-14 07:52:14.521408', '2025-12-14 07:52:14.521408');
INSERT INTO public.product_images VALUES (135, 34, 'RG_Hearts_Braclet_2_lock_view.jpeg', 4, '2025-12-14 07:52:14.930582', '2025-12-14 07:52:14.930582');
INSERT INTO public.product_images VALUES (136, 35, 'YG_Hearts_Bracelet_2.jpeg', 2, '2025-12-14 07:56:05.990565', '2025-12-14 07:56:05.990565');
INSERT INTO public.product_images VALUES (137, 35, 'YG_Hearts_Bracelet_2_back_view.jpeg', 3, '2025-12-14 07:56:06.46467', '2025-12-14 07:56:06.46467');
INSERT INTO public.product_images VALUES (138, 35, 'YG_Hearts_Bracelet_2_lock_view.jpeg', 4, '2025-12-14 07:56:06.847914', '2025-12-14 07:56:06.847914');
INSERT INTO public.product_images VALUES (139, 36, 'WG_Hearts_Bracelet_2.jpeg', 2, '2025-12-14 07:59:59.023662', '2025-12-14 07:59:59.023662');
INSERT INTO public.product_images VALUES (140, 36, 'WG_Hearts_Bracelet_2_back_view.jpeg', 3, '2025-12-14 07:59:59.391476', '2025-12-14 07:59:59.391476');
INSERT INTO public.product_images VALUES (141, 36, 'WG_Hearts_Bracelet_2_lock_view.jpeg', 4, '2025-12-14 07:59:59.753305', '2025-12-14 07:59:59.753305');
INSERT INTO public.product_images VALUES (142, 37, 'RG_V_by_Vene.jpeg', 2, '2025-12-14 08:25:39.188253', '2025-12-14 08:25:39.188253');
INSERT INTO public.product_images VALUES (143, 37, 'RG_V_by_Vene_angle_view.jpeg', 3, '2025-12-14 08:25:39.60699', '2025-12-14 08:25:39.60699');
INSERT INTO public.product_images VALUES (144, 37, 'RG_V_by_Vene_angle_view_1.jpeg', 4, '2025-12-14 08:25:40.009721', '2025-12-14 08:25:40.009721');
INSERT INTO public.product_images VALUES (145, 37, 'RG_V_by_Vene_angle_view_2.jpeg', 5, '2025-12-14 08:25:40.462962', '2025-12-14 08:25:40.462962');
INSERT INTO public.product_images VALUES (146, 38, 'YG_V_by_Vene_Bracelet.jpeg', 2, '2025-12-14 08:28:02.621742', '2025-12-14 08:28:02.621742');
INSERT INTO public.product_images VALUES (147, 38, 'YG_V_by_Vene_Bracelet_angle_view.jpeg', 3, '2025-12-14 08:28:03.126861', '2025-12-14 08:28:03.126861');
INSERT INTO public.product_images VALUES (148, 38, 'YG_V_by_Vene_Bracelet_angle_view_1.jpeg', 4, '2025-12-14 08:28:03.604729', '2025-12-14 08:28:03.604729');
INSERT INTO public.product_images VALUES (149, 38, 'YG_V_by_Vene_Bracelet_angle_view_2.jpeg', 5, '2025-12-14 08:28:04.03539', '2025-12-14 08:28:04.03539');
INSERT INTO public.product_images VALUES (150, 39, 'WG_V_by_Vene.jpeg', 2, '2025-12-14 08:31:52.380953', '2025-12-14 08:31:52.380953');
INSERT INTO public.product_images VALUES (151, 39, 'WG_V_by_Vene._angle_view.jpeg', 3, '2025-12-14 08:31:52.743968', '2025-12-14 08:31:52.743968');
INSERT INTO public.product_images VALUES (152, 39, 'WG_V_by_Vene._angle_view_1.jpeg', 4, '2025-12-14 08:31:53.091455', '2025-12-14 08:31:53.091455');
INSERT INTO public.product_images VALUES (153, 39, 'WG_V_by_Vene.angle_view_2.jpeg', 5, '2025-12-14 08:31:53.446116', '2025-12-14 08:31:53.446116');
INSERT INTO public.product_images VALUES (154, 40, 'YG_Vetra_Bracelet.jpeg', 2, '2025-12-15 12:44:25.417943', '2025-12-15 12:44:25.417943');
INSERT INTO public.product_images VALUES (155, 40, 'YG_Vetra_Bracelet_angle_view.jpeg', 3, '2025-12-15 12:44:25.800301', '2025-12-15 12:44:25.800301');
INSERT INTO public.product_images VALUES (156, 40, 'YG_Vetra_Bracelet_angle_view_1.jpeg', 4, '2025-12-15 12:44:26.203742', '2025-12-15 12:44:26.203742');
INSERT INTO public.product_images VALUES (157, 40, 'YG_Vetra_Bracelet_angle_view_2.jpeg', 5, '2025-12-15 12:44:26.710808', '2025-12-15 12:44:26.710808');
INSERT INTO public.product_images VALUES (158, 41, 'RG_Vetra_Bracelet.jpeg', 2, '2025-12-15 12:53:36.519758', '2025-12-15 12:53:36.519758');
INSERT INTO public.product_images VALUES (159, 41, 'RG_Vetra_Bracelet._angle_view.jpeg', 3, '2025-12-15 12:53:36.857476', '2025-12-15 12:53:36.857476');
INSERT INTO public.product_images VALUES (160, 41, 'RG_Vetra_Bracelet._angle_view_1.jpeg', 4, '2025-12-15 12:53:37.201953', '2025-12-15 12:53:37.201953');
INSERT INTO public.product_images VALUES (161, 41, 'RG_Vetra_Bracelet._angle_view_2.jpeg', 5, '2025-12-15 12:53:37.587902', '2025-12-15 12:53:37.587902');
INSERT INTO public.product_images VALUES (162, 42, 'YG_flower_yellow_stone_pendant_front_view.jpeg', 2, '2025-12-15 13:11:49.282015', '2025-12-15 13:11:49.282015');
INSERT INTO public.product_images VALUES (163, 42, 'YG_flower_yellow_stone_pendant_angle_view.jpeg', 3, '2025-12-15 13:11:49.620299', '2025-12-15 13:11:49.620299');
INSERT INTO public.product_images VALUES (164, 42, 'YG_flower_yellow_stone_pendant_side_view.jpeg', 4, '2025-12-15 13:11:49.957231', '2025-12-15 13:11:49.957231');
INSERT INTO public.product_images VALUES (165, 42, 'YG_flower_yellow_stone_pendant_back_view.jpeg', 5, '2025-12-15 13:11:50.296118', '2025-12-15 13:11:50.296118');
INSERT INTO public.product_images VALUES (166, 43, 'WG_Vetra_Bracelet.jpeg', 2, '2025-12-15 13:15:55.288972', '2025-12-15 13:15:55.288972');
INSERT INTO public.product_images VALUES (167, 43, 'WG_Vetra_Bracelet_angle_view.jpeg', 3, '2025-12-15 13:15:55.678622', '2025-12-15 13:15:55.678622');
INSERT INTO public.product_images VALUES (168, 43, 'WG_Vetra_Bracelet_angle_view_1.jpeg', 4, '2025-12-15 13:15:55.997391', '2025-12-15 13:15:55.997391');
INSERT INTO public.product_images VALUES (169, 43, 'WG_Vetra_Bracelet_angle_view_2.jpeg', 5, '2025-12-15 13:15:56.304608', '2025-12-15 13:15:56.304608');
INSERT INTO public.product_images VALUES (170, 44, 'YG_Love_Harmony_Ring.jpeg', 2, '2025-12-15 13:21:47.926327', '2025-12-15 13:21:47.926327');
INSERT INTO public.product_images VALUES (171, 44, 'YG_Love_Harmony_Ring_front_view.jpeg', 3, '2025-12-15 13:21:48.364551', '2025-12-15 13:21:48.364551');
INSERT INTO public.product_images VALUES (172, 44, 'YG_Love_Harmony_Ring_side_view.jpeg', 4, '2025-12-15 13:21:48.801116', '2025-12-15 13:21:48.801116');
INSERT INTO public.product_images VALUES (173, 44, 'YG_Love_Harmony_angle_view_1.jpeg', 5, '2025-12-15 13:21:49.192968', '2025-12-15 13:21:49.192968');
INSERT INTO public.product_images VALUES (174, 45, 'YG_Blush_Promise_Ring.jpeg', 2, '2025-12-15 13:57:35.011653', '2025-12-15 13:57:35.011653');
INSERT INTO public.product_images VALUES (175, 45, 'YG_Blush_Promise_Ring_front_view.jpeg', 3, '2025-12-15 13:57:35.413613', '2025-12-15 13:57:35.413613');
INSERT INTO public.product_images VALUES (176, 45, 'YG_Blush_Promise_Ring_side_view.jpeg', 4, '2025-12-15 13:57:35.756895', '2025-12-15 13:57:35.756895');
INSERT INTO public.product_images VALUES (177, 45, 'YG_Blush_Promise_Ring_angle_view.jpeg', 5, '2025-12-15 13:57:36.185104', '2025-12-15 13:57:36.185104');
INSERT INTO public.product_images VALUES (178, 46, 'YG_Evergreen_crown_ring_top_view.jpeg', 2, '2025-12-15 14:07:59.401928', '2025-12-15 14:07:59.401928');
INSERT INTO public.product_images VALUES (179, 46, 'YG_Evergreen_crown_ring_front_view.jpeg', 3, '2025-12-15 14:08:00.329764', '2025-12-15 14:08:00.329764');
INSERT INTO public.product_images VALUES (180, 46, 'YG_Evergreen_crown_ring_side_view.jpeg', 4, '2025-12-15 14:08:00.812455', '2025-12-15 14:08:00.812455');
INSERT INTO public.product_images VALUES (181, 46, 'YG_Evergreen_crown_ring_angle_view.jpeg', 5, '2025-12-15 14:08:01.320812', '2025-12-15 14:08:01.320812');
INSERT INTO public.product_images VALUES (182, 47, 'WG_Evergreen_crown_ring_top_view.jpeg', 2, '2025-12-15 15:31:53.10194', '2025-12-15 15:31:53.10194');
INSERT INTO public.product_images VALUES (183, 47, 'WG_Evergreen_crown_ring_front_view.jpeg', 3, '2025-12-15 15:31:53.487799', '2025-12-15 15:31:53.487799');
INSERT INTO public.product_images VALUES (184, 47, 'WG_Evergreen_crown_ring_side_view.jpeg', 4, '2025-12-15 15:31:53.831044', '2025-12-15 15:31:53.831044');
INSERT INTO public.product_images VALUES (185, 47, 'WG_Evergreen_crown_ring_angle_view.jpeg', 5, '2025-12-15 15:31:54.189212', '2025-12-15 15:31:54.189212');
INSERT INTO public.product_images VALUES (186, 48, 'WG_Love_Harmony_Ring.jpeg', 2, '2025-12-15 15:38:57.762043', '2025-12-15 15:38:57.762043');
INSERT INTO public.product_images VALUES (187, 48, 'WG_Love_Harmony_Ring_front_view.jpeg', 3, '2025-12-15 15:38:58.13734', '2025-12-15 15:38:58.13734');
INSERT INTO public.product_images VALUES (188, 48, 'WG_Love_Harmony_Ring_side_view.jpeg', 4, '2025-12-15 15:38:58.503155', '2025-12-15 15:38:58.503155');
INSERT INTO public.product_images VALUES (189, 48, 'WG_Love_Harmony_angle_view_1.jpeg', 5, '2025-12-15 15:38:58.888899', '2025-12-15 15:38:58.888899');
INSERT INTO public.product_images VALUES (190, 49, 'WG_Peach_Morganite_.jpeg', 2, '2025-12-15 15:45:56.703883', '2025-12-15 15:45:56.703883');
INSERT INTO public.product_images VALUES (191, 49, 'WG_ring_peach_morganite_side_view.jpeg', 3, '2025-12-15 15:45:57.151414', '2025-12-15 15:45:57.151414');
INSERT INTO public.product_images VALUES (192, 49, 'WG_ring_peach_morganite_front_view.jpeg', 4, '2025-12-15 15:45:57.552409', '2025-12-15 15:45:57.552409');
INSERT INTO public.product_images VALUES (193, 49, 'WG_Peach_Morganite_angle_view.jpeg', 5, '2025-12-15 15:45:57.924951', '2025-12-15 15:45:57.924951');
INSERT INTO public.product_images VALUES (194, 50, 'RG_VETRA_RING.png', 2, '2025-12-15 16:08:05.841793', '2025-12-15 16:08:05.841793');
INSERT INTO public.product_images VALUES (195, 50, 'RG_VETRA_ring_front_view.jpeg', 3, '2025-12-15 16:08:06.366163', '2025-12-15 16:08:06.366163');
INSERT INTO public.product_images VALUES (196, 50, 'RG_VETRA_RING_side_view.png', 4, '2025-12-15 16:08:07.308356', '2025-12-15 16:08:07.308356');
INSERT INTO public.product_images VALUES (197, 50, 'RG_VETRA_RING_angle_view.jpeg', 5, '2025-12-15 16:08:07.705882', '2025-12-15 16:08:07.705882');
INSERT INTO public.product_images VALUES (198, 51, 'RG_Love_Harmony_Ring.jpeg', 2, '2025-12-15 16:15:12.707984', '2025-12-15 16:15:12.707984');
INSERT INTO public.product_images VALUES (199, 51, 'RG_Love_Harmony_Ring_front_view.jpeg', 3, '2025-12-15 16:15:13.220446', '2025-12-15 16:15:13.220446');
INSERT INTO public.product_images VALUES (200, 51, 'RG_Love_Harmony_Ring_side_view.jpeg', 4, '2025-12-15 16:15:13.642095', '2025-12-15 16:15:13.642095');
INSERT INTO public.product_images VALUES (201, 51, 'RG_Love_Harmony_Ring_angle_view1.jpeg', 5, '2025-12-15 16:15:14.143814', '2025-12-15 16:15:14.143814');
INSERT INTO public.product_images VALUES (206, 53, 'RG_Peach_Morganite_Ring.jpeg', 2, '2025-12-15 17:25:07.01907', '2025-12-15 17:25:07.01907');
INSERT INTO public.product_images VALUES (207, 53, 'RG_Peach_Morganite_angle_view.jpeg', 3, '2025-12-15 17:25:07.57796', '2025-12-15 17:25:07.57796');
INSERT INTO public.product_images VALUES (208, 53, 'RG_Ring_Peach_Morganite_side_view.jpeg', 4, '2025-12-15 17:25:08.052622', '2025-12-15 17:25:08.052622');
INSERT INTO public.product_images VALUES (209, 53, 'RG_Ring_Peach_Morganite_front_view.jpeg', 5, '2025-12-15 17:25:08.553983', '2025-12-15 17:25:08.553983');
INSERT INTO public.product_images VALUES (210, 54, 'Majesty_in_Violet_Ring.JPG', 2, '2025-12-15 17:36:57.498498', '2025-12-15 17:36:57.498498');
INSERT INTO public.product_images VALUES (211, 54, 'Majesty_in_Violet_2_hands.JPG', 3, '2025-12-15 17:36:57.934084', '2025-12-15 17:36:57.934084');
INSERT INTO public.product_images VALUES (212, 54, 'Majesty_in_Violet_-hand_pic.PNG', 4, '2025-12-15 17:36:59.365479', '2025-12-15 17:36:59.365479');
INSERT INTO public.product_images VALUES (213, 55, 'RG_Blush_Promise_Ring.jpeg', 2, '2025-12-15 17:52:38.94729', '2025-12-15 17:52:38.94729');
INSERT INTO public.product_images VALUES (214, 55, 'RG_Blush_Promise_Ring_front_view.jpeg', 3, '2025-12-15 17:52:39.345007', '2025-12-15 17:52:39.345007');
INSERT INTO public.product_images VALUES (215, 55, 'RG_Blush_Promise_Ring_side_view.jpeg', 4, '2025-12-15 17:52:39.723082', '2025-12-15 17:52:39.723082');
INSERT INTO public.product_images VALUES (216, 55, 'RG_Blush_Promise_Ring_angle_view.jpeg', 5, '2025-12-15 17:52:40.106355', '2025-12-15 17:52:40.106355');
INSERT INTO public.product_images VALUES (217, 56, 'WG_Blush_Promise_Ring.jpeg', 2, '2025-12-15 17:57:59.089967', '2025-12-15 17:57:59.089967');
INSERT INTO public.product_images VALUES (218, 56, 'WG_Blush_Promise_Ring_front_view.jpeg', 3, '2025-12-15 17:57:59.452226', '2025-12-15 17:57:59.452226');
INSERT INTO public.product_images VALUES (219, 56, 'WG_Blush_Promise_Ring_side_view.jpeg', 4, '2025-12-15 17:57:59.882455', '2025-12-15 17:57:59.882455');
INSERT INTO public.product_images VALUES (220, 56, 'WG_Blush_Promise_Ring_angle_view.jpeg', 5, '2025-12-15 17:58:00.274313', '2025-12-15 17:58:00.274313');
INSERT INTO public.product_images VALUES (221, 57, 'YG_Vetra_ring.png', 2, '2025-12-15 18:13:38.993478', '2025-12-15 18:13:38.993478');
INSERT INTO public.product_images VALUES (222, 57, 'YG_Vetra_ring_front_view.jpeg', 3, '2025-12-15 18:13:39.358849', '2025-12-15 18:13:39.358849');
INSERT INTO public.product_images VALUES (223, 57, 'YG_Vetra_ring_side_view.png', 4, '2025-12-15 18:13:40.246579', '2025-12-15 18:13:40.246579');
INSERT INTO public.product_images VALUES (224, 57, 'YG_Vetra_ring_angle_view.jpeg', 5, '2025-12-15 18:13:40.598748', '2025-12-15 18:13:40.598748');
INSERT INTO public.product_images VALUES (225, 58, 'WG_Vetra_ring.png', 2, '2025-12-15 18:18:29.026661', '2025-12-15 18:18:29.026661');
INSERT INTO public.product_images VALUES (226, 58, 'WG_Vetra_ring_front_view.jpeg', 3, '2025-12-15 18:18:29.439009', '2025-12-15 18:18:29.439009');
INSERT INTO public.product_images VALUES (227, 58, 'WG_Vetra_ring_side_view.png', 4, '2025-12-15 18:18:30.306237', '2025-12-15 18:18:30.306237');
INSERT INTO public.product_images VALUES (228, 58, 'WG_Vetra_ring_angle_view.jpeg', 5, '2025-12-15 18:18:30.717507', '2025-12-15 18:18:30.717507');
INSERT INTO public.product_images VALUES (229, 59, 'RG_Peach_Morganite_Ring.jpeg', 2, '2025-12-15 18:24:58.201794', '2025-12-15 18:24:58.201794');
INSERT INTO public.product_images VALUES (230, 59, 'RG_Ring_Peach_Morganite_side_view.jpeg', 3, '2025-12-15 18:24:58.5791', '2025-12-15 18:24:58.5791');
INSERT INTO public.product_images VALUES (231, 59, 'RG_Peach_Morganite_angle_view.jpeg', 4, '2025-12-15 18:24:59.008506', '2025-12-15 18:24:59.008506');
INSERT INTO public.product_images VALUES (232, 59, 'RG_Ring_Peach_Morganite_front_view.jpeg', 5, '2025-12-15 18:24:59.41844', '2025-12-15 18:24:59.41844');
INSERT INTO public.product_images VALUES (233, 60, 'WG_Peach_Morganite_.jpeg', 2, '2025-12-15 18:28:05.435858', '2025-12-15 18:28:05.435858');
INSERT INTO public.product_images VALUES (234, 60, 'WG_Peach_Morganite_angle_view.jpeg', 3, '2025-12-15 18:28:05.856836', '2025-12-15 18:28:05.856836');
INSERT INTO public.product_images VALUES (235, 60, 'WG_ring_peach_morganite_side_view.jpeg', 4, '2025-12-15 18:28:06.379883', '2025-12-15 18:28:06.379883');
INSERT INTO public.product_images VALUES (236, 60, 'WG_ring_peach_morganite_front_view.jpeg', 5, '2025-12-15 18:28:06.840748', '2025-12-15 18:28:06.840748');
INSERT INTO public.product_images VALUES (237, 61, 'YG_Peach_Morganite_.jpeg', 2, '2025-12-15 18:30:04.892423', '2025-12-15 18:30:04.892423');
INSERT INTO public.product_images VALUES (238, 61, 'YG_Peach_Morganite_angle_view.jpeg', 3, '2025-12-15 18:30:05.320958', '2025-12-15 18:30:05.320958');
INSERT INTO public.product_images VALUES (239, 61, 'YG_Ring_Peach_Morganite_side_view.jpeg', 4, '2025-12-15 18:30:05.705562', '2025-12-15 18:30:05.705562');
INSERT INTO public.product_images VALUES (240, 61, 'YG_Ring_Peach_Morganite_front_view.jpeg', 5, '2025-12-15 18:30:06.09688', '2025-12-15 18:30:06.09688');
INSERT INTO public.product_images VALUES (243, 63, 'WG_Ocean_Light_Top_view.jpeg', 2, '2025-12-15 20:28:25.067003', '2025-12-15 20:28:25.067003');
INSERT INTO public.product_images VALUES (244, 63, 'WG_Ocean_Light_angle_view.jpeg', 3, '2025-12-15 20:28:25.456245', '2025-12-15 20:28:25.456245');
INSERT INTO public.product_images VALUES (245, 63, 'WG_Ocean_Light_side_view.jpeg', 4, '2025-12-15 20:28:25.795295', '2025-12-15 20:28:25.795295');
INSERT INTO public.product_images VALUES (246, 63, 'WG_Ocean_Light_back_view.jpeg', 5, '2025-12-15 20:28:26.106156', '2025-12-15 20:28:26.106156');
INSERT INTO public.product_images VALUES (247, 64, 'WG_Flower_yellow_stone_pendant_front_view.jpeg', 2, '2025-12-15 20:33:41.231631', '2025-12-15 20:33:41.231631');
INSERT INTO public.product_images VALUES (248, 64, 'WG_flower_yellow_pendant_angle_view.jpeg', 3, '2025-12-15 20:33:41.589113', '2025-12-15 20:33:41.589113');
INSERT INTO public.product_images VALUES (249, 64, 'WG_flower_yellow_stone_pendant_side_view.jpeg', 4, '2025-12-15 20:33:41.874864', '2025-12-15 20:33:41.874864');
INSERT INTO public.product_images VALUES (250, 64, 'WG_flower_yellow_stone_pendant_back_view.jpeg', 5, '2025-12-15 20:33:42.191407', '2025-12-15 20:33:42.191407');
INSERT INTO public.product_images VALUES (251, 65, 'Square_Necklace.JPG', 2, '2025-12-15 20:44:55.263723', '2025-12-15 20:44:55.263723');
INSERT INTO public.product_images VALUES (252, 65, 'square_standing_necklace.JPG', 3, '2025-12-15 20:44:55.754266', '2025-12-15 20:44:55.754266');
INSERT INTO public.product_images VALUES (253, 23, 'RG_Peach_Morganite_Ring.jpeg', 9, '2025-12-15 20:58:28.92475', '2025-12-15 20:58:28.92475');
INSERT INTO public.product_images VALUES (254, 23, 'RG_Peach_Morganite_angle_view.jpeg', 10, '2025-12-15 20:58:29.291308', '2025-12-15 20:58:29.291308');
INSERT INTO public.product_images VALUES (256, 23, 'RG_Ring_Peach_Morganite_front_view.jpeg', 12, '2025-12-15 20:58:29.991579', '2025-12-15 20:58:29.991579');
INSERT INTO public.product_images VALUES (257, 66, 'YG_Vetra_Bracelet.jpeg', 2, '2025-12-16 11:52:56.082146', '2025-12-16 11:52:56.082146');
INSERT INTO public.product_images VALUES (258, 66, 'YG_Vetra_Bracelet_angle_view.jpeg', 3, '2025-12-16 11:52:56.526055', '2025-12-16 11:52:56.526055');
INSERT INTO public.product_images VALUES (259, 66, 'YG_Vetra_Bracelet_angle_view_1.jpeg', 4, '2025-12-16 11:52:56.950698', '2025-12-16 11:52:56.950698');
INSERT INTO public.product_images VALUES (260, 66, 'YG_Vetra_Bracelet_angle_view_2.jpeg', 5, '2025-12-16 11:52:57.354868', '2025-12-16 11:52:57.354868');
INSERT INTO public.product_images VALUES (261, 67, 'YG_Candy_Bracelet.jpeg', 2, '2025-12-16 11:57:04.78374', '2025-12-16 11:57:04.78374');
INSERT INTO public.product_images VALUES (262, 67, 'YG_Candy_Bracelet_full.jpeg', 3, '2025-12-16 11:57:05.144231', '2025-12-16 11:57:05.144231');
INSERT INTO public.product_images VALUES (263, 67, 'YG_Candy_Bracelet_Vene_diamond_shape.jpeg', 4, '2025-12-16 11:57:05.536574', '2025-12-16 11:57:05.536574');
INSERT INTO public.product_images VALUES (264, 68, 'YG_Hearts_Breaclet.jpeg', 2, '2025-12-16 12:01:11.411158', '2025-12-16 12:01:11.411158');
INSERT INTO public.product_images VALUES (265, 68, 'YG_Hearts_Breaclet_full.jpeg', 3, '2025-12-16 12:01:11.749015', '2025-12-16 12:01:11.749015');
INSERT INTO public.product_images VALUES (266, 68, 'YG_Hearts_Breaclet_back_view.jpeg', 4, '2025-12-16 12:01:12.119833', '2025-12-16 12:01:12.119833');
INSERT INTO public.product_images VALUES (267, 68, 'YG_Hearts_Bracelet_diamond_shape.jpeg', 5, '2025-12-16 12:01:12.462464', '2025-12-16 12:01:12.462464');
INSERT INTO public.product_images VALUES (268, 69, 'YG_Hearts_Bracelet_2.jpeg', 2, '2025-12-16 12:09:07.639725', '2025-12-16 12:09:07.639725');
INSERT INTO public.product_images VALUES (269, 69, 'YG_Hearts_Bracelet_2_back_view.jpeg', 3, '2025-12-16 12:09:08.110475', '2025-12-16 12:09:08.110475');
INSERT INTO public.product_images VALUES (270, 69, 'YG_Hearts_Bracelet_2_lock_view.jpeg', 4, '2025-12-16 12:09:08.621454', '2025-12-16 12:09:08.621454');
INSERT INTO public.product_images VALUES (271, 70, 'YG_V_by_Vene_Bracelet.jpeg', 2, '2025-12-16 12:19:20.8318', '2025-12-16 12:19:20.8318');
INSERT INTO public.product_images VALUES (272, 70, 'YG_V_by_Vene_Bracelet_angle_view.jpeg', 3, '2025-12-16 12:19:21.207207', '2025-12-16 12:19:21.207207');
INSERT INTO public.product_images VALUES (273, 70, 'YG_V_by_Vene_Bracelet_angle_view_1.jpeg', 4, '2025-12-16 12:19:21.529202', '2025-12-16 12:19:21.529202');
INSERT INTO public.product_images VALUES (274, 70, 'YG_V_by_Vene_Bracelet_angle_view_2.jpeg', 5, '2025-12-16 12:19:21.829989', '2025-12-16 12:19:21.829989');
INSERT INTO public.product_images VALUES (275, 71, 'RG_Hearts_Bracelet.jpeg', 2, '2025-12-16 12:29:34.049062', '2025-12-16 12:29:34.049062');
INSERT INTO public.product_images VALUES (276, 71, 'RG_Hearts_Bracelet_full.jpeg', 3, '2025-12-16 12:29:34.370456', '2025-12-16 12:29:34.370456');
INSERT INTO public.product_images VALUES (277, 71, 'RG_Hearts_Bracelet_back_view.jpeg', 4, '2025-12-16 12:29:34.692931', '2025-12-16 12:29:34.692931');
INSERT INTO public.product_images VALUES (278, 71, 'RG_Hearts_Bracelet_Diamond_shape.jpeg', 5, '2025-12-16 12:29:35.013894', '2025-12-16 12:29:35.013894');
INSERT INTO public.product_images VALUES (279, 72, 'RG_Hearts_Braclet_2.jpeg', 2, '2025-12-16 13:00:16.33049', '2025-12-16 13:00:16.33049');
INSERT INTO public.product_images VALUES (280, 72, 'RG_Hearts_Braclet_2_back_view.jpeg', 3, '2025-12-16 13:00:16.817225', '2025-12-16 13:00:16.817225');
INSERT INTO public.product_images VALUES (281, 72, 'RG_Hearts_Braclet_2_lock_view.jpeg', 4, '2025-12-16 13:00:17.283552', '2025-12-16 13:00:17.283552');
INSERT INTO public.product_images VALUES (282, 73, 'RG_Candy_Bracelet.jpeg', 2, '2025-12-16 13:04:29.760688', '2025-12-16 13:04:29.760688');
INSERT INTO public.product_images VALUES (283, 73, 'RG_Candy_Bracelet_full.jpeg', 3, '2025-12-16 13:04:30.244503', '2025-12-16 13:04:30.244503');
INSERT INTO public.product_images VALUES (284, 73, 'RG_Candy_Bracelet_Vene_diamond_shape.jpeg', 4, '2025-12-16 13:04:30.700598', '2025-12-16 13:04:30.700598');
INSERT INTO public.product_images VALUES (285, 74, 'RG_V_by_Vene.jpeg', 2, '2025-12-16 18:36:35.520765', '2025-12-16 18:36:35.520765');
INSERT INTO public.product_images VALUES (286, 74, 'RG_V_by_Vene_angle_view.jpeg', 3, '2025-12-16 18:36:36.039418', '2025-12-16 18:36:36.039418');
INSERT INTO public.product_images VALUES (287, 74, 'RG_V_by_Vene_angle_view_1.jpeg', 4, '2025-12-16 18:36:36.411067', '2025-12-16 18:36:36.411067');
INSERT INTO public.product_images VALUES (288, 74, 'RG_V_by_Vene_angle_view_2.jpeg', 5, '2025-12-16 18:36:36.73912', '2025-12-16 18:36:36.73912');
INSERT INTO public.product_images VALUES (289, 75, 'WG_V_by_Vene.jpeg', 2, '2025-12-16 18:39:06.530231', '2025-12-16 18:39:06.530231');
INSERT INTO public.product_images VALUES (290, 75, 'WG_V_by_Vene._angle_view.jpeg', 3, '2025-12-16 18:39:07.274784', '2025-12-16 18:39:07.274784');
INSERT INTO public.product_images VALUES (291, 75, 'WG_V_by_Vene._angle_view_1.jpeg', 4, '2025-12-16 18:39:07.818863', '2025-12-16 18:39:07.818863');
INSERT INTO public.product_images VALUES (292, 75, 'WG_V_by_Vene.angle_view_2.jpeg', 5, '2025-12-16 18:39:08.34407', '2025-12-16 18:39:08.34407');
INSERT INTO public.product_images VALUES (293, 76, 'WG_Hearts_Bracelet_Chain.jpeg', 2, '2025-12-16 18:41:23.671307', '2025-12-16 18:41:23.671307');
INSERT INTO public.product_images VALUES (294, 76, 'WG_Hearts_Bracelet_Chain_full.jpeg', 3, '2025-12-16 18:41:24.137884', '2025-12-16 18:41:24.137884');
INSERT INTO public.product_images VALUES (295, 76, 'WG_Hearts_Breaclet_back_view.jpeg', 4, '2025-12-16 18:41:24.61741', '2025-12-16 18:41:24.61741');
INSERT INTO public.product_images VALUES (296, 76, 'WG_Hearts_Bracelet_Chain_diamond_chape.jpeg', 5, '2025-12-16 18:41:24.965206', '2025-12-16 18:41:24.965206');
INSERT INTO public.product_images VALUES (297, 77, 'WG_Hearts_Bracelet_2.jpeg', 2, '2025-12-16 18:44:02.533422', '2025-12-16 18:44:02.533422');
INSERT INTO public.product_images VALUES (298, 77, 'WG_Hearts_Bracelet_2_back_view.jpeg', 3, '2025-12-16 18:44:03.549759', '2025-12-16 18:44:03.549759');
INSERT INTO public.product_images VALUES (299, 77, 'WG_Hearts_Bracelet_2_lock_view.jpeg', 4, '2025-12-16 18:44:04.568399', '2025-12-16 18:44:04.568399');
INSERT INTO public.product_images VALUES (300, 78, 'WG_Vetra_Bracelet.jpeg', 2, '2025-12-16 18:46:56.752416', '2025-12-16 18:46:56.752416');
INSERT INTO public.product_images VALUES (301, 78, 'WG_Vetra_Bracelet_angle_view.jpeg', 3, '2025-12-16 18:46:57.093661', '2025-12-16 18:46:57.093661');
INSERT INTO public.product_images VALUES (302, 78, 'WG_Vetra_Bracelet_angle_view_1.jpeg', 4, '2025-12-16 18:46:57.525104', '2025-12-16 18:46:57.525104');
INSERT INTO public.product_images VALUES (303, 78, 'WG_Vetra_Bracelet_angle_view_2.jpeg', 5, '2025-12-16 18:46:57.895641', '2025-12-16 18:46:57.895641');
INSERT INTO public.product_images VALUES (304, 79, 'WG_Candy_Bracelet.jpeg', 2, '2025-12-16 18:49:54.965854', '2025-12-16 18:49:54.965854');
INSERT INTO public.product_images VALUES (305, 79, 'WG_Candy_Bracelet_full.jpeg', 3, '2025-12-16 18:49:55.356192', '2025-12-16 18:49:55.356192');
INSERT INTO public.product_images VALUES (306, 79, 'WG_Candy_Bracelet_Vene_diamond_shape.jpeg', 4, '2025-12-16 18:49:55.788649', '2025-12-16 18:49:55.788649');
INSERT INTO public.product_images VALUES (307, 80, 'RG_Vetra_Bracelet.jpeg', 2, '2025-12-17 08:29:40.415117', '2025-12-17 08:29:40.415117');
INSERT INTO public.product_images VALUES (308, 80, 'RG_Vetra_Bracelet._angle_view.jpeg', 3, '2025-12-17 08:29:40.82663', '2025-12-17 08:29:40.82663');
INSERT INTO public.product_images VALUES (309, 80, 'RG_Vetra_Bracelet._angle_view_1.jpeg', 4, '2025-12-17 08:29:41.173691', '2025-12-17 08:29:41.173691');
INSERT INTO public.product_images VALUES (310, 80, 'RG_Vetra_Bracelet._angle_view_2.jpeg', 5, '2025-12-17 08:29:41.580784', '2025-12-17 08:29:41.580784');
INSERT INTO public.product_images VALUES (311, 81, 'Mother_necklace_hollow.JPG', 2, '2025-12-17 09:08:50.842001', '2025-12-17 09:08:50.842001');
INSERT INTO public.product_images VALUES (312, 81, 'heart_mother_necklace.JPG', 3, '2025-12-17 09:08:51.514507', '2025-12-17 09:08:51.514507');
INSERT INTO public.product_images VALUES (316, 83, 'Mother_necklace-Black_stone.JPG', 2, '2025-12-17 09:26:06.254012', '2025-12-17 09:26:06.254012');
INSERT INTO public.product_images VALUES (317, 83, 'Black_heart-_mother_necklace.JPG', 3, '2025-12-17 09:26:06.76386', '2025-12-17 09:26:06.76386');
INSERT INTO public.product_images VALUES (318, 83, '2_necklace_mother_black_stone_necklace.JPG', 4, '2025-12-17 09:26:07.249538', '2025-12-17 09:26:07.249538');
INSERT INTO public.product_images VALUES (319, 84, 'Vera_V_Pendant_angle_view.jpeg', 2, '2025-12-20 09:00:16.098921', '2025-12-20 09:00:16.098921');
INSERT INTO public.product_images VALUES (320, 84, 'Vera_V_pendant_angle_view_2.jpeg', 3, '2025-12-20 09:00:16.577763', '2025-12-20 09:00:16.577763');
INSERT INTO public.product_images VALUES (321, 84, '3_crystal_necklaces_top_view.jpeg', 4, '2025-12-20 09:00:17.17757', '2025-12-20 09:00:17.17757');
INSERT INTO public.product_images VALUES (322, 85, 'Vera_V_Pendant_angle_view.jpeg', 2, '2025-12-20 09:03:29.264657', '2025-12-20 09:03:29.264657');
INSERT INTO public.product_images VALUES (323, 85, 'Vera_V_pendant_angle_view_2.jpeg', 3, '2025-12-20 09:03:29.657482', '2025-12-20 09:03:29.657482');
INSERT INTO public.product_images VALUES (324, 85, '3_crystal_necklaces_top_view.jpeg', 4, '2025-12-20 09:03:30.176838', '2025-12-20 09:03:30.176838');
INSERT INTO public.product_images VALUES (329, 87, 'YG_Vetra_ring.png', 2, '2025-12-20 09:27:10.098653', '2025-12-20 09:27:10.098653');
INSERT INTO public.product_images VALUES (330, 87, 'YG_Vetra_ring_front_view.jpeg', 3, '2025-12-20 09:27:10.601919', '2025-12-20 09:27:10.601919');
INSERT INTO public.product_images VALUES (331, 87, 'YG_Vetra_ring_side_view.png', 4, '2025-12-20 09:27:11.576981', '2025-12-20 09:27:11.576981');
INSERT INTO public.product_images VALUES (332, 87, 'YG_Vetra_ring_angle_view.jpeg', 5, '2025-12-20 09:27:12.022221', '2025-12-20 09:27:12.022221');
INSERT INTO public.product_images VALUES (333, 88, 'Silent_waterfall_necklace_top_view.jpeg', 2, '2025-12-20 10:13:58.875879', '2025-12-20 10:13:58.875879');
INSERT INTO public.product_images VALUES (334, 88, '3_crystal_necklaces_top_view.jpeg', 3, '2025-12-20 10:13:59.212937', '2025-12-20 10:13:59.212937');
INSERT INTO public.product_images VALUES (335, 89, 'Silent_waterfall_necklace_top_view.jpeg', 2, '2025-12-20 10:16:53.923823', '2025-12-20 10:16:53.923823');
INSERT INTO public.product_images VALUES (336, 89, '3_crystal_necklaces_top_view.jpeg', 3, '2025-12-20 10:16:54.273839', '2025-12-20 10:16:54.273839');
INSERT INTO public.product_images VALUES (340, 91, '2_stars_beaclet_top_view.jpeg', 3, '2025-12-20 12:34:22.039796', '2025-12-20 12:34:22.039796');
INSERT INTO public.product_images VALUES (341, 91, '2_stars_bracelet_on_hand_model.jpeg', 4, '2025-12-20 12:34:22.326693', '2025-12-20 12:34:22.326693');
INSERT INTO public.product_images VALUES (343, 92, '2_stars_beaclet_top_view.jpeg', 3, '2025-12-20 12:36:20.674763', '2025-12-20 12:36:20.674763');
INSERT INTO public.product_images VALUES (344, 92, '2_stars_bracelet_on_hand_model.jpeg', 4, '2025-12-20 12:36:20.942214', '2025-12-20 12:36:20.942214');
INSERT INTO public.product_images VALUES (345, 93, 'RG_VETRA_RING.png', 2, '2026-01-13 05:45:18.019674', '2026-01-13 05:45:18.019674');
INSERT INTO public.product_images VALUES (346, 93, 'RG_VETRA_ring_front_view.jpeg', 3, '2026-01-13 05:45:19.127839', '2026-01-13 05:45:19.127839');
INSERT INTO public.product_images VALUES (347, 93, 'RG_VETRA_RING_side_view.png', 4, '2026-01-13 05:45:21.312886', '2026-01-13 05:45:21.312886');
INSERT INTO public.product_images VALUES (348, 93, 'RG_VETRA_RING_angle_view.jpeg', 5, '2026-01-13 05:45:22.540868', '2026-01-13 05:45:22.540868');
INSERT INTO public.product_images VALUES (349, 94, 'WG_Vetra_ring.png', 2, '2026-01-13 05:49:09.259043', '2026-01-13 05:49:09.259043');
INSERT INTO public.product_images VALUES (350, 94, 'WG_Vetra_ring_front_view.jpeg', 3, '2026-01-13 05:49:09.785298', '2026-01-13 05:49:09.785298');
INSERT INTO public.product_images VALUES (351, 94, 'WG_Vetra_ring_side_view.png', 4, '2026-01-13 05:49:10.693901', '2026-01-13 05:49:10.693901');
INSERT INTO public.product_images VALUES (352, 94, 'WG_Vetra_ring_angle_view.jpeg', 5, '2026-01-13 05:49:11.101434', '2026-01-13 05:49:11.101434');
INSERT INTO public.product_images VALUES (355, 96, 'YG_Pacman_front_view.jpeg', 2, '2026-01-21 06:46:43.012478', '2026-01-21 06:46:43.012478');
INSERT INTO public.product_images VALUES (356, 96, 'YG_Pacman_angle_view.jpeg', 3, '2026-01-21 06:46:43.437554', '2026-01-21 06:46:43.437554');
INSERT INTO public.product_images VALUES (357, 96, 'YG_Pacman_side_view.jpeg', 4, '2026-01-21 06:46:43.86346', '2026-01-21 06:46:43.86346');
INSERT INTO public.product_images VALUES (358, 96, 'YG_Pacman_lock_view.jpeg', 5, '2026-01-21 06:46:44.244538', '2026-01-21 06:46:44.244538');
INSERT INTO public.product_images VALUES (359, 97, 'RG_Pacman_Front_view.jpeg', 2, '2026-01-22 10:05:32.041241', '2026-01-22 10:05:32.041241');
INSERT INTO public.product_images VALUES (360, 97, 'RG_Pacman_Angle_view.jpeg', 3, '2026-01-22 10:05:32.40724', '2026-01-22 10:05:32.40724');
INSERT INTO public.product_images VALUES (361, 97, 'RG_Pacman_side_view.jpeg', 4, '2026-01-22 10:05:32.811271', '2026-01-22 10:05:32.811271');
INSERT INTO public.product_images VALUES (362, 97, 'RG_Pacman_lock_view.jpeg', 5, '2026-01-22 10:05:33.189097', '2026-01-22 10:05:33.189097');
INSERT INTO public.product_images VALUES (363, 98, 'YG_Pacman_front_view.jpeg', 2, '2026-01-22 10:09:25.055417', '2026-01-22 10:09:25.055417');
INSERT INTO public.product_images VALUES (364, 98, 'YG_Pacman_angle_view.jpeg', 3, '2026-01-22 10:09:25.600124', '2026-01-22 10:09:25.600124');
INSERT INTO public.product_images VALUES (365, 98, 'YG_Pacman_side_view.jpeg', 4, '2026-01-22 10:09:26.056773', '2026-01-22 10:09:26.056773');
INSERT INTO public.product_images VALUES (366, 98, 'YG_Pacman_lock_view.jpeg', 5, '2026-01-22 10:09:26.602831', '2026-01-22 10:09:26.602831');
INSERT INTO public.product_images VALUES (367, 99, 'WG_pacman_front_view.jpeg', 2, '2026-01-22 10:14:36.17814', '2026-01-22 10:14:36.17814');
INSERT INTO public.product_images VALUES (368, 99, 'WG_pacman_angle_view.jpeg', 3, '2026-01-22 10:14:36.56464', '2026-01-22 10:14:36.56464');
INSERT INTO public.product_images VALUES (369, 99, 'WG_pacman_side_view.jpeg', 4, '2026-01-22 10:14:36.905149', '2026-01-22 10:14:36.905149');
INSERT INTO public.product_images VALUES (370, 99, 'WG_pacman_lock_view.jpeg', 5, '2026-01-22 10:14:37.300122', '2026-01-22 10:14:37.300122');
INSERT INTO public.product_images VALUES (371, 100, 'Flora_Essence_Necklace.jpg', 2, '2026-01-22 15:18:42.808163', '2026-01-22 15:18:42.808163');
INSERT INTO public.product_images VALUES (372, 101, 'Flora_Essence_Necklace.jpg', 2, '2026-01-22 15:21:15.673432', '2026-01-22 15:21:15.673432');
INSERT INTO public.product_images VALUES (373, 102, 'Flora_Essence_Earrings.jpg', 2, '2026-01-22 16:15:55.496278', '2026-01-22 16:15:55.496278');
INSERT INTO public.product_images VALUES (374, 105, 'Solar_Flora_2_Earrings.jpg', 2, '2026-01-22 19:18:52.88291', '2026-01-22 19:18:52.88291');
INSERT INTO public.product_images VALUES (375, 106, 'Solar_Flora_2_ring.jpg', 2, '2026-01-22 19:24:31.741717', '2026-01-22 19:24:31.741717');
INSERT INTO public.product_images VALUES (376, 107, 'Solar_Flora_2_ring.jpg', 2, '2026-01-22 19:29:46.905368', '2026-01-22 19:29:46.905368');
INSERT INTO public.product_images VALUES (377, 108, 'Rosa_Light_Earrings.jpg', 2, '2026-01-22 19:44:42.980665', '2026-01-22 19:44:42.980665');
INSERT INTO public.product_images VALUES (378, 109, 'Rosa_Light_Necklace.jpg', 2, '2026-01-22 19:53:50.47024', '2026-01-22 19:53:50.47024');
INSERT INTO public.product_images VALUES (379, 110, 'Rosa_Light_Necklace.jpg', 2, '2026-01-22 19:58:04.138844', '2026-01-22 19:58:04.138844');
INSERT INTO public.product_images VALUES (380, 111, 'WG_Peach_Morganite_.jpeg', 2, '2026-01-23 06:49:22.949373', '2026-01-23 06:49:22.949373');
INSERT INTO public.product_images VALUES (381, 111, 'WG_ring_peach_morganite_front_view.jpeg', 3, '2026-01-23 06:49:23.563977', '2026-01-23 06:49:23.563977');
INSERT INTO public.product_images VALUES (382, 111, 'WG_ring_peach_morganite_side_view.jpeg', 4, '2026-01-23 06:49:24.113476', '2026-01-23 06:49:24.113476');
INSERT INTO public.product_images VALUES (383, 111, 'WG_Peach_Morganite_angle_view.jpeg', 5, '2026-01-23 06:49:24.475912', '2026-01-23 06:49:24.475912');
INSERT INTO public.product_images VALUES (384, 112, 'YG_Peach_Morganite_.jpeg', 2, '2026-01-23 06:52:17.07104', '2026-01-23 06:52:17.07104');
INSERT INTO public.product_images VALUES (385, 112, 'YG_Ring_Peach_Morganite_front_view.jpeg', 3, '2026-01-23 06:52:17.424846', '2026-01-23 06:52:17.424846');
INSERT INTO public.product_images VALUES (386, 112, 'YG_Ring_Peach_Morganite_side_view.jpeg', 4, '2026-01-23 06:52:17.753241', '2026-01-23 06:52:17.753241');
INSERT INTO public.product_images VALUES (387, 112, 'YG_Peach_Morganite_angle_view.jpeg', 5, '2026-01-23 06:52:18.099349', '2026-01-23 06:52:18.099349');
INSERT INTO public.product_images VALUES (388, 113, 'RG_Peach_Morganite_Ring.jpeg', 2, '2026-01-23 06:54:33.986621', '2026-01-23 06:54:33.986621');
INSERT INTO public.product_images VALUES (389, 113, 'RG_Ring_Peach_Morganite_front_view.jpeg', 3, '2026-01-23 06:54:34.333855', '2026-01-23 06:54:34.333855');
INSERT INTO public.product_images VALUES (390, 113, 'RG_Ring_Peach_Morganite_side_view.jpeg', 4, '2026-01-23 06:54:34.916657', '2026-01-23 06:54:34.916657');
INSERT INTO public.product_images VALUES (391, 113, 'RG_Peach_Morganite_angle_view.jpeg', 5, '2026-01-23 06:54:35.51895', '2026-01-23 06:54:35.51895');
INSERT INTO public.product_images VALUES (392, 114, 'Rotate_Necklace.jpg', 2, '2026-01-23 17:10:55.282444', '2026-01-23 17:10:55.282444');
INSERT INTO public.product_images VALUES (393, 115, 'Rotate_Necklace.jpg', 2, '2026-01-23 17:13:56.134013', '2026-01-23 17:13:56.134013');
INSERT INTO public.product_images VALUES (394, 3, 'Moon_Star_Necklace__Studio_.jpeg', 6, '2026-01-23 17:16:38.48134', '2026-01-23 17:16:38.48134');
INSERT INTO public.product_images VALUES (395, 62, 'Moon_Star_Necklace__Studio_.jpeg', 2, '2026-01-23 17:18:08.371417', '2026-01-23 17:18:08.371417');
INSERT INTO public.product_images VALUES (396, 116, 'YG_Beirut_domes_Earrings.jpeg', 2, '2026-01-23 18:51:52.842199', '2026-01-23 18:51:52.842199');
INSERT INTO public.product_images VALUES (397, 116, 'YG_Beirut_Domes_Earrings_1.jpeg', 3, '2026-01-23 18:51:53.500593', '2026-01-23 18:51:53.500593');
INSERT INTO public.product_images VALUES (398, 116, 'YG_Beirut_Domes_Earrings_2.jpeg', 4, '2026-01-23 18:51:54.051902', '2026-01-23 18:51:54.051902');
INSERT INTO public.product_images VALUES (399, 117, 'WG_Beirut_Domes_Earrings.jpeg', 2, '2026-01-23 18:56:00.752331', '2026-01-23 18:56:00.752331');
INSERT INTO public.product_images VALUES (400, 117, 'WG_Beirut_domes_Earrings_1.jpeg', 3, '2026-01-23 18:56:01.411195', '2026-01-23 18:56:01.411195');
INSERT INTO public.product_images VALUES (401, 117, 'WG_Beirut_Domes_Earrings_2.jpeg', 4, '2026-01-23 18:56:02.167902', '2026-01-23 18:56:02.167902');
INSERT INTO public.product_images VALUES (402, 118, 'WG_Beirut_Domes_necklace_front_view.jpeg', 2, '2026-01-23 19:08:34.878315', '2026-01-23 19:08:34.878315');
INSERT INTO public.product_images VALUES (403, 118, 'WG_Beirut_Domes_necklace_angle_view.jpeg', 3, '2026-01-23 19:08:35.315895', '2026-01-23 19:08:35.315895');
INSERT INTO public.product_images VALUES (404, 118, 'WG_Beirut_Domes_necklace_side_view.jpeg', 4, '2026-01-23 19:08:35.715396', '2026-01-23 19:08:35.715396');
INSERT INTO public.product_images VALUES (405, 118, 'WG_Beirut_Domes_necklace_back_view.jpeg', 5, '2026-01-23 19:08:36.092347', '2026-01-23 19:08:36.092347');
INSERT INTO public.product_images VALUES (406, 118, 'WG_Beirut_Domes_necklace_lock_view.jpeg', 6, '2026-01-23 19:08:36.474249', '2026-01-23 19:08:36.474249');
INSERT INTO public.product_images VALUES (407, 118, 'WG_Beirut_Domes_necklace_full_view.jpeg', 7, '2026-01-23 19:08:36.85868', '2026-01-23 19:08:36.85868');
INSERT INTO public.product_images VALUES (408, 119, 'YG_Beirut_Domes_Necklace_Front_view.jpeg', 2, '2026-01-23 19:12:50.088437', '2026-01-23 19:12:50.088437');
INSERT INTO public.product_images VALUES (409, 119, 'YG_Beirut_Domes_Necklace_angle_view.jpeg', 3, '2026-01-23 19:12:50.554137', '2026-01-23 19:12:50.554137');
INSERT INTO public.product_images VALUES (410, 119, 'YG_Beirut_Domes_Necklace_side_view.jpeg', 4, '2026-01-23 19:12:51.004156', '2026-01-23 19:12:51.004156');
INSERT INTO public.product_images VALUES (411, 119, 'YG_Beirut_Domes_Necklace_back_view.jpeg', 5, '2026-01-23 19:12:51.519903', '2026-01-23 19:12:51.519903');
INSERT INTO public.product_images VALUES (412, 119, 'YG_Beirut_Domes_Necklace_lock_view.jpeg', 6, '2026-01-23 19:12:51.956869', '2026-01-23 19:12:51.956869');
INSERT INTO public.product_images VALUES (413, 119, 'YG_Beirut_Domes_Necklace_full_view.jpeg', 7, '2026-01-23 19:12:52.425471', '2026-01-23 19:12:52.425471');
INSERT INTO public.product_images VALUES (414, 120, 'YG_Beirut_Domes_Necklace_Front_view.jpeg', 2, '2026-01-23 19:15:25.159077', '2026-01-23 19:15:25.159077');
INSERT INTO public.product_images VALUES (415, 120, 'YG_Beirut_Domes_Necklace_angle_view.jpeg', 3, '2026-01-23 19:15:25.592902', '2026-01-23 19:15:25.592902');
INSERT INTO public.product_images VALUES (416, 120, 'YG_Beirut_Domes_Necklace_side_view.jpeg', 4, '2026-01-23 19:15:26.023969', '2026-01-23 19:15:26.023969');
INSERT INTO public.product_images VALUES (417, 120, 'YG_Beirut_Domes_Necklace_back_view.jpeg', 5, '2026-01-23 19:15:26.512106', '2026-01-23 19:15:26.512106');
INSERT INTO public.product_images VALUES (418, 120, 'YG_Beirut_Domes_Necklace_lock_view.jpeg', 6, '2026-01-23 19:15:26.917709', '2026-01-23 19:15:26.917709');
INSERT INTO public.product_images VALUES (419, 120, 'YG_Beirut_Domes_Necklace_full_view.jpeg', 7, '2026-01-23 19:15:27.284902', '2026-01-23 19:15:27.284902');
INSERT INTO public.product_images VALUES (420, 121, 'WG_Beirut_Domes_Ring_Top_view.jpeg', 2, '2026-01-23 19:22:47.19271', '2026-01-23 19:22:47.19271');
INSERT INTO public.product_images VALUES (421, 121, 'WG_Beirut_Domes_Ring_front_view.jpeg', 3, '2026-01-23 19:22:47.641459', '2026-01-23 19:22:47.641459');
INSERT INTO public.product_images VALUES (422, 121, 'WG_Beirut_Domes_Ring_side_view.jpeg', 4, '2026-01-23 19:22:48.040431', '2026-01-23 19:22:48.040431');
INSERT INTO public.product_images VALUES (423, 121, 'WG_Beirut_Domes_Ring_angle_view.jpeg', 5, '2026-01-23 19:22:48.467464', '2026-01-23 19:22:48.467464');
INSERT INTO public.product_images VALUES (424, 122, 'WG_Beirut_Domes_Ring_Top_view.jpeg', 2, '2026-01-23 19:36:05.362635', '2026-01-23 19:36:05.362635');
INSERT INTO public.product_images VALUES (425, 122, 'WG_Beirut_Domes_Ring_front_view.jpeg', 3, '2026-01-23 19:36:06.019375', '2026-01-23 19:36:06.019375');
INSERT INTO public.product_images VALUES (426, 122, 'WG_Beirut_Domes_Ring_side_view.jpeg', 4, '2026-01-23 19:36:06.689247', '2026-01-23 19:36:06.689247');
INSERT INTO public.product_images VALUES (427, 122, 'WG_Beirut_Domes_Ring_angle_view.jpeg', 5, '2026-01-23 19:36:07.304669', '2026-01-23 19:36:07.304669');
INSERT INTO public.product_images VALUES (428, 123, 'WG_Beirut_Domes_necklace_front_view.jpeg', 2, '2026-01-23 19:44:59.29571', '2026-01-23 19:44:59.29571');
INSERT INTO public.product_images VALUES (429, 123, 'WG_Beirut_Domes_necklace_angle_view.jpeg', 3, '2026-01-23 19:44:59.779011', '2026-01-23 19:44:59.779011');
INSERT INTO public.product_images VALUES (430, 123, 'WG_Beirut_Domes_necklace_side_view.jpeg', 4, '2026-01-23 19:45:00.246145', '2026-01-23 19:45:00.246145');
INSERT INTO public.product_images VALUES (431, 123, 'WG_Beirut_Domes_necklace_back_view.jpeg', 5, '2026-01-23 19:45:00.901925', '2026-01-23 19:45:00.901925');
INSERT INTO public.product_images VALUES (432, 123, 'WG_Beirut_Domes_necklace_lock_view.jpeg', 6, '2026-01-23 19:45:01.446743', '2026-01-23 19:45:01.446743');
INSERT INTO public.product_images VALUES (433, 123, 'WG_Beirut_Domes_necklace_full_view.jpeg', 7, '2026-01-23 19:45:02.067967', '2026-01-23 19:45:02.067967');
INSERT INTO public.product_images VALUES (434, 124, 'YG_Beirut_Domes_Ring_Top_view.jpeg', 2, '2026-01-23 19:50:38.636607', '2026-01-23 19:50:38.636607');
INSERT INTO public.product_images VALUES (435, 124, 'YG_Beirut_Domes_Ring_front_view.jpeg', 3, '2026-01-23 19:50:39.047077', '2026-01-23 19:50:39.047077');
INSERT INTO public.product_images VALUES (436, 124, 'YG_Beirut_Domes_Ring_side_view.jpeg', 4, '2026-01-23 19:50:39.548845', '2026-01-23 19:50:39.548845');
INSERT INTO public.product_images VALUES (437, 124, 'YG_Beirut_Domes_Ring_angle_view.jpeg', 5, '2026-01-23 19:50:39.990438', '2026-01-23 19:50:39.990438');
INSERT INTO public.product_images VALUES (438, 90, 'Infinte_Love_Necklace__studio_.jpg', 2, '2026-01-23 20:04:57.966085', '2026-01-23 20:04:57.966085');
INSERT INTO public.product_images VALUES (439, 125, 'WG_Beirut_Domes_Bracelet_top_view.jpeg', 2, '2026-01-27 16:15:41.600113', '2026-01-27 16:15:41.600113');
INSERT INTO public.product_images VALUES (440, 125, 'WG_Beirut_Domes_Bracelet_full_view.jpeg', 3, '2026-01-27 16:15:42.266943', '2026-01-27 16:15:42.266943');
INSERT INTO public.product_images VALUES (441, 125, 'WG_Beirut_Domes_Bracelet_lock_view.jpeg', 4, '2026-01-27 16:15:43.079061', '2026-01-27 16:15:43.079061');
INSERT INTO public.product_images VALUES (442, 125, 'WG_Beirut_Domes_Bracelet_back_view.jpeg', 5, '2026-01-27 16:15:43.62887', '2026-01-27 16:15:43.62887');
INSERT INTO public.product_images VALUES (443, 126, 'WG_Beirut_Domes_Bracelet_top_view.jpeg', 2, '2026-01-27 16:19:27.578369', '2026-01-27 16:19:27.578369');
INSERT INTO public.product_images VALUES (444, 126, 'WG_Beirut_Domes_Bracelet_full_view.jpeg', 3, '2026-01-27 16:19:28.138195', '2026-01-27 16:19:28.138195');
INSERT INTO public.product_images VALUES (445, 126, 'WG_Beirut_Domes_Bracelet_lock_view.jpeg', 4, '2026-01-27 16:19:28.932467', '2026-01-27 16:19:28.932467');
INSERT INTO public.product_images VALUES (446, 126, 'WG_Beirut_Domes_Bracelet_back_view.jpeg', 5, '2026-01-27 16:19:29.611381', '2026-01-27 16:19:29.611381');
INSERT INTO public.product_images VALUES (447, 127, 'YG_Beirut_Domes_Bracelet_Top_view.jpeg', 2, '2026-01-27 16:23:11.846081', '2026-01-27 16:23:11.846081');
INSERT INTO public.product_images VALUES (448, 127, 'YG_Beirut_Domes_Bracelet_full_view.jpeg', 3, '2026-01-27 16:23:12.4719', '2026-01-27 16:23:12.4719');
INSERT INTO public.product_images VALUES (449, 127, 'YG_Beirut_Domes_Bracelet_lock_view.jpeg', 4, '2026-01-27 16:23:13.265928', '2026-01-27 16:23:13.265928');
INSERT INTO public.product_images VALUES (450, 127, 'YG_Beirut_Domes_Bracelet_back_view.jpeg', 5, '2026-01-27 16:23:13.89691', '2026-01-27 16:23:13.89691');
INSERT INTO public.product_images VALUES (451, 128, 'WG_Beirut_Domes_Bracelet_top_view.jpeg', 2, '2026-01-27 16:27:11.274624', '2026-01-27 16:27:11.274624');
INSERT INTO public.product_images VALUES (452, 128, 'WG_Beirut_Domes_Bracelet_full_view.jpeg', 3, '2026-01-27 16:27:12.215633', '2026-01-27 16:27:12.215633');
INSERT INTO public.product_images VALUES (453, 128, 'WG_Beirut_Domes_Bracelet_lock_view.jpeg', 4, '2026-01-27 16:27:13.187106', '2026-01-27 16:27:13.187106');
INSERT INTO public.product_images VALUES (454, 128, 'WG_Beirut_Domes_Bracelet_back_view.jpeg', 5, '2026-01-27 16:27:14.003851', '2026-01-27 16:27:14.003851');
INSERT INTO public.product_images VALUES (455, 129, 'RG_Wing_Earrings_Top_View.jpeg', 2, '2026-01-27 16:43:12.644911', '2026-01-27 16:43:12.644911');
INSERT INTO public.product_images VALUES (456, 129, 'RG_Wing_Earrings_side_View.jpeg', 3, '2026-01-27 16:43:13.133549', '2026-01-27 16:43:13.133549');
INSERT INTO public.product_images VALUES (457, 129, 'RG_Wing_Earrings_back_View.jpeg', 4, '2026-01-27 16:43:14.090291', '2026-01-27 16:43:14.090291');
INSERT INTO public.product_images VALUES (458, 130, 'WG_Wing_Necklace_top_view.jpeg', 2, '2026-01-28 11:52:42.385362', '2026-01-28 11:52:42.385362');
INSERT INTO public.product_images VALUES (459, 130, 'WG_Wing_Necklace_angle_view.jpeg', 3, '2026-01-28 11:52:43.322351', '2026-01-28 11:52:43.322351');
INSERT INTO public.product_images VALUES (460, 130, 'WG_Wing_Necklace_side_view.jpeg', 4, '2026-01-28 11:52:44.336302', '2026-01-28 11:52:44.336302');
INSERT INTO public.product_images VALUES (461, 130, 'WG_Wing_Necklace_back_view.jpeg', 5, '2026-01-28 11:52:45.03413', '2026-01-28 11:52:45.03413');
INSERT INTO public.product_images VALUES (462, 130, 'WG_Wing_Necklace_full_view.jpeg', 6, '2026-01-28 11:52:45.532327', '2026-01-28 11:52:45.532327');
INSERT INTO public.product_images VALUES (463, 130, 'WG_Wing_Necklace_Lock_View.jpeg', 7, '2026-01-28 11:52:46.430297', '2026-01-28 11:52:46.430297');
INSERT INTO public.product_images VALUES (464, 131, 'WG_Wing_Necklace_top_view.jpeg', 2, '2026-01-28 12:06:19.179106', '2026-01-28 12:06:19.179106');
INSERT INTO public.product_images VALUES (465, 131, 'WG_Wing_Necklace_angle_view.jpeg', 3, '2026-01-28 12:06:20.428653', '2026-01-28 12:06:20.428653');
INSERT INTO public.product_images VALUES (466, 131, 'WG_Wing_Necklace_side_view.jpeg', 4, '2026-01-28 12:06:21.210752', '2026-01-28 12:06:21.210752');
INSERT INTO public.product_images VALUES (467, 131, 'WG_Wing_Necklace_back_view.jpeg', 5, '2026-01-28 12:06:22.118586', '2026-01-28 12:06:22.118586');
INSERT INTO public.product_images VALUES (468, 131, 'WG_Wing_Necklace_full_view.jpeg', 6, '2026-01-28 12:06:22.767858', '2026-01-28 12:06:22.767858');
INSERT INTO public.product_images VALUES (469, 131, 'WG_Wing_Necklace_Lock_View.jpeg', 7, '2026-01-28 12:06:23.439516', '2026-01-28 12:06:23.439516');
INSERT INTO public.product_images VALUES (470, 132, 'YG_Wing_Necklace_Top_view.jpeg', 2, '2026-01-28 12:08:39.725368', '2026-01-28 12:08:39.725368');
INSERT INTO public.product_images VALUES (471, 132, 'YG_Wing_Necklace_angle_view.jpeg', 3, '2026-01-28 12:08:40.234328', '2026-01-28 12:08:40.234328');
INSERT INTO public.product_images VALUES (472, 132, 'YG_Wing_Necklace_side_view.jpeg', 4, '2026-01-28 12:08:40.948393', '2026-01-28 12:08:40.948393');
INSERT INTO public.product_images VALUES (473, 132, 'YG_Wing_Necklace_back_view.jpeg', 5, '2026-01-28 12:08:41.72437', '2026-01-28 12:08:41.72437');
INSERT INTO public.product_images VALUES (474, 132, 'YG_Wing_Necklace_full_view.jpeg', 6, '2026-01-28 12:08:42.227286', '2026-01-28 12:08:42.227286');
INSERT INTO public.product_images VALUES (475, 132, 'YG_Wing_Necklace_lock_view.jpeg', 7, '2026-01-28 12:08:42.933578', '2026-01-28 12:08:42.933578');
INSERT INTO public.product_images VALUES (482, 133, 'YG_Wing_Necklace_Double_Top_View.jpeg', 2, '2026-01-28 12:23:15.013922', '2026-01-28 12:23:15.013922');
INSERT INTO public.product_images VALUES (483, 133, 'YG_Wing_Necklace_Double_angle_View.jpeg', 3, '2026-01-28 12:23:15.665309', '2026-01-28 12:23:15.665309');
INSERT INTO public.product_images VALUES (484, 133, 'YG_Wing_Necklace_Double_side_View.jpeg', 4, '2026-01-28 12:23:16.119661', '2026-01-28 12:23:16.119661');
INSERT INTO public.product_images VALUES (485, 133, 'YG_Wing_Necklace_Double_back_View.jpeg', 5, '2026-01-28 12:23:16.626721', '2026-01-28 12:23:16.626721');
INSERT INTO public.product_images VALUES (486, 133, 'YG_Wing_Necklace_Double_full_View.jpeg', 6, '2026-01-28 12:23:17.10413', '2026-01-28 12:23:17.10413');
INSERT INTO public.product_images VALUES (487, 133, 'YG_Wing_Necklace_Double_lock_View.jpeg', 7, '2026-01-28 12:23:17.590554', '2026-01-28 12:23:17.590554');
INSERT INTO public.product_images VALUES (488, 134, 'YG_Wing_Necklace_Double_Top_View.jpeg', 2, '2026-01-28 12:28:26.963303', '2026-01-28 12:28:26.963303');
INSERT INTO public.product_images VALUES (489, 134, 'YG_Wing_Necklace_Double_angle_View.jpeg', 3, '2026-01-28 12:28:27.71883', '2026-01-28 12:28:27.71883');
INSERT INTO public.product_images VALUES (490, 134, 'YG_Wing_Necklace_Double_side_View.jpeg', 4, '2026-01-28 12:28:28.304692', '2026-01-28 12:28:28.304692');
INSERT INTO public.product_images VALUES (491, 134, 'YG_Wing_Necklace_Double_back_View.jpeg', 5, '2026-01-28 12:28:29.024596', '2026-01-28 12:28:29.024596');
INSERT INTO public.product_images VALUES (492, 134, 'YG_Wing_Necklace_Double_full_View.jpeg', 6, '2026-01-28 12:28:29.591592', '2026-01-28 12:28:29.591592');
INSERT INTO public.product_images VALUES (493, 134, 'YG_Wing_Necklace_Double_lock_View.jpeg', 7, '2026-01-28 12:28:30.35884', '2026-01-28 12:28:30.35884');
INSERT INTO public.product_images VALUES (494, 135, 'WG_Wing_Necklace_Double_Top_View.jpeg', 2, '2026-01-28 12:30:44.619459', '2026-01-28 12:30:44.619459');
INSERT INTO public.product_images VALUES (495, 135, 'WG_Wing_Necklace_Double_angle_View.jpeg', 3, '2026-01-28 12:30:45.205787', '2026-01-28 12:30:45.205787');
INSERT INTO public.product_images VALUES (496, 135, 'WG_Wing_Necklace_Double_side_View.jpeg', 4, '2026-01-28 12:30:45.776039', '2026-01-28 12:30:45.776039');
INSERT INTO public.product_images VALUES (497, 135, 'WG_Wing_Necklace_Double_back_View.jpeg', 5, '2026-01-28 12:30:46.318754', '2026-01-28 12:30:46.318754');
INSERT INTO public.product_images VALUES (498, 135, 'WG_Wing_Necklace_Double_full_View.jpeg', 6, '2026-01-28 12:30:46.855437', '2026-01-28 12:30:46.855437');
INSERT INTO public.product_images VALUES (499, 135, 'WG_Wing_Necklace_Double_lock_View.jpeg', 7, '2026-01-28 12:30:47.48942', '2026-01-28 12:30:47.48942');
INSERT INTO public.product_images VALUES (500, 136, 'WG_Wing_ring_top_view.jpeg', 2, '2026-01-28 12:35:19.344152', '2026-01-28 12:35:19.344152');
INSERT INTO public.product_images VALUES (501, 136, 'WG_Wing_ring_front_view.jpeg', 3, '2026-01-28 12:35:20.051977', '2026-01-28 12:35:20.051977');
INSERT INTO public.product_images VALUES (502, 136, 'WG_Wing_ring_side_view.jpeg', 4, '2026-01-28 12:35:20.811045', '2026-01-28 12:35:20.811045');
INSERT INTO public.product_images VALUES (503, 136, 'WG_Wing_ring_angle_view.jpeg', 5, '2026-01-28 12:35:21.395427', '2026-01-28 12:35:21.395427');
INSERT INTO public.product_images VALUES (504, 137, 'RG_Wing_Necklace_Double_Top_view.jpeg', 2, '2026-01-28 12:37:45.201516', '2026-01-28 12:37:45.201516');
INSERT INTO public.product_images VALUES (505, 137, 'RG_Wing_Necklace_Double_angle_view.jpeg', 3, '2026-01-28 12:37:46.369999', '2026-01-28 12:37:46.369999');
INSERT INTO public.product_images VALUES (506, 137, 'RG_Wing_Necklace_Double_side_view.jpeg', 4, '2026-01-28 12:37:46.990654', '2026-01-28 12:37:46.990654');
INSERT INTO public.product_images VALUES (507, 137, 'RG_Wing_Necklace_Double_back_view.jpeg', 5, '2026-01-28 12:37:47.537687', '2026-01-28 12:37:47.537687');
INSERT INTO public.product_images VALUES (508, 137, 'RG_Wing_Necklace_Double_full_view.jpeg', 6, '2026-01-28 12:37:48.038106', '2026-01-28 12:37:48.038106');
INSERT INTO public.product_images VALUES (509, 137, 'RG_Wing_Necklace_Double_lock_view.jpeg', 7, '2026-01-28 12:37:48.578723', '2026-01-28 12:37:48.578723');
INSERT INTO public.product_images VALUES (510, 138, 'RG_Wing_necklace_top_view.jpeg', 2, '2026-01-28 12:39:34.590269', '2026-01-28 12:39:34.590269');
INSERT INTO public.product_images VALUES (511, 138, 'RG_Wing_necklace_angle_view.jpeg', 3, '2026-01-28 12:39:34.97005', '2026-01-28 12:39:34.97005');
INSERT INTO public.product_images VALUES (512, 138, 'RG_Wing_necklace_side_view.jpeg', 4, '2026-01-28 12:39:35.393809', '2026-01-28 12:39:35.393809');
INSERT INTO public.product_images VALUES (513, 138, 'RG_Wing_necklace_back_view.jpeg', 5, '2026-01-28 12:39:35.87332', '2026-01-28 12:39:35.87332');
INSERT INTO public.product_images VALUES (514, 138, 'RG_Wing_necklace_full_view.jpeg', 6, '2026-01-28 12:39:36.354549', '2026-01-28 12:39:36.354549');
INSERT INTO public.product_images VALUES (515, 138, 'RG_Wing_necklace_lock_view.jpeg', 7, '2026-01-28 12:39:37.40383', '2026-01-28 12:39:37.40383');
INSERT INTO public.product_images VALUES (516, 139, 'WG_Wing_ring_top_view.jpeg', 2, '2026-01-28 12:43:06.013569', '2026-01-28 12:43:06.013569');
INSERT INTO public.product_images VALUES (517, 139, 'WG_Wing_ring_front_view.jpeg', 3, '2026-01-28 12:43:07.63736', '2026-01-28 12:43:07.63736');
INSERT INTO public.product_images VALUES (518, 139, 'WG_Wing_ring_side_view.jpeg', 4, '2026-01-28 12:43:08.984583', '2026-01-28 12:43:08.984583');
INSERT INTO public.product_images VALUES (519, 139, 'WG_Wing_ring_angle_view.jpeg', 5, '2026-01-28 12:43:11.409631', '2026-01-28 12:43:11.409631');
INSERT INTO public.product_images VALUES (520, 140, 'YG_Wing_ring_top_view.jpeg', 2, '2026-01-28 12:46:00.317951', '2026-01-28 12:46:00.317951');
INSERT INTO public.product_images VALUES (521, 140, 'YG_Wing_ring_front_view.jpeg', 3, '2026-01-28 12:46:01.377294', '2026-01-28 12:46:01.377294');
INSERT INTO public.product_images VALUES (522, 140, 'YG_Wing_ring_side_view.jpeg', 4, '2026-01-28 12:46:03.105812', '2026-01-28 12:46:03.105812');
INSERT INTO public.product_images VALUES (523, 140, 'YG_Wing_ring_angle_view.jpeg', 5, '2026-01-28 12:46:03.876369', '2026-01-28 12:46:03.876369');
INSERT INTO public.product_images VALUES (524, 141, 'RG_Wing_Ring_Top_View_.jpeg', 2, '2026-01-28 12:47:43.626951', '2026-01-28 12:47:43.626951');
INSERT INTO public.product_images VALUES (525, 141, 'RG_Wing_Ring_front_View.jpeg', 3, '2026-01-28 12:47:44.263616', '2026-01-28 12:47:44.263616');
INSERT INTO public.product_images VALUES (526, 141, 'RG_Wing_Ring_side_View.jpeg', 4, '2026-01-28 12:47:45.522989', '2026-01-28 12:47:45.522989');
INSERT INTO public.product_images VALUES (527, 141, 'RG_Wing_Ring_angle_View.jpeg', 5, '2026-01-28 12:47:47.072552', '2026-01-28 12:47:47.072552');
INSERT INTO public.product_images VALUES (528, 142, 'RG_Wing_Ring_Top_View_.jpeg', 2, '2026-01-28 12:50:31.170893', '2026-01-28 12:50:31.170893');
INSERT INTO public.product_images VALUES (529, 142, 'RG_Wing_Ring_front_View.jpeg', 3, '2026-01-28 12:50:31.672357', '2026-01-28 12:50:31.672357');
INSERT INTO public.product_images VALUES (530, 142, 'RG_Wing_Ring_side_View.jpeg', 4, '2026-01-28 12:50:32.281332', '2026-01-28 12:50:32.281332');
INSERT INTO public.product_images VALUES (531, 142, 'RG_Wing_Ring_angle_View.jpeg', 5, '2026-01-28 12:50:33.031342', '2026-01-28 12:50:33.031342');
INSERT INTO public.product_images VALUES (532, 143, 'WG_Wing_Earrings_Top_view.jpeg', 2, '2026-01-29 06:22:25.670714', '2026-01-29 06:22:25.670714');
INSERT INTO public.product_images VALUES (533, 143, 'WG_Wing_Earrings_side_view.jpeg', 3, '2026-01-29 06:22:26.500098', '2026-01-29 06:22:26.500098');
INSERT INTO public.product_images VALUES (534, 143, 'WG_Wing_Earrings_back_view.jpeg', 4, '2026-01-29 06:22:27.302863', '2026-01-29 06:22:27.302863');
INSERT INTO public.product_images VALUES (535, 144, 'YG_Wing_Earrings_Top_View.jpeg', 2, '2026-01-29 06:25:05.914569', '2026-01-29 06:25:05.914569');
INSERT INTO public.product_images VALUES (536, 144, 'YG_Wing_Earrings_side_View.jpeg', 3, '2026-01-29 06:25:07.058381', '2026-01-29 06:25:07.058381');
INSERT INTO public.product_images VALUES (537, 144, 'YG_Wing_Earrings_back_View.jpeg', 4, '2026-01-29 06:25:08.119931', '2026-01-29 06:25:08.119931');
INSERT INTO public.product_images VALUES (538, 145, 'WG_Wing_Bracelet_Top_View.jpeg', 2, '2026-01-29 06:39:15.184865', '2026-01-29 06:39:15.184865');
INSERT INTO public.product_images VALUES (539, 145, 'WG_Wing_Bracelet_full_View.jpeg', 3, '2026-01-29 06:39:15.789703', '2026-01-29 06:39:15.789703');
INSERT INTO public.product_images VALUES (540, 145, 'WG_Wing_Bracelet_lock_View.jpeg', 4, '2026-01-29 06:39:16.350775', '2026-01-29 06:39:16.350775');
INSERT INTO public.product_images VALUES (544, 146, 'WG_Wing_Bracelet_Top_View.jpeg', 2, '2026-01-29 06:42:15.603602', '2026-01-29 06:42:15.603602');
INSERT INTO public.product_images VALUES (545, 146, 'WG_Wing_Bracelet_full_View.jpeg', 3, '2026-01-29 06:42:16.496812', '2026-01-29 06:42:16.496812');
INSERT INTO public.product_images VALUES (546, 146, 'WG_Wing_Bracelet_lock_View.jpeg', 4, '2026-01-29 06:42:17.118974', '2026-01-29 06:42:17.118974');
INSERT INTO public.product_images VALUES (547, 147, 'YG_Wing_Bracelet_Top_View.jpeg', 2, '2026-01-29 06:44:08.215252', '2026-01-29 06:44:08.215252');
INSERT INTO public.product_images VALUES (548, 147, 'YG_Wing_Bracelet_full_View.jpeg', 3, '2026-01-29 06:44:09.725141', '2026-01-29 06:44:09.725141');
INSERT INTO public.product_images VALUES (549, 147, 'YG_Wing_Bracelet_lock_View.jpeg', 4, '2026-01-29 06:44:10.812882', '2026-01-29 06:44:10.812882');
INSERT INTO public.product_images VALUES (550, 148, 'YG_Wing_Bracelet_Top_View.jpeg', 2, '2026-01-29 06:45:09.261432', '2026-01-29 06:45:09.261432');
INSERT INTO public.product_images VALUES (551, 148, 'YG_Wing_Bracelet_full_View.jpeg', 3, '2026-01-29 06:45:09.84528', '2026-01-29 06:45:09.84528');
INSERT INTO public.product_images VALUES (552, 148, 'YG_Wing_Bracelet_lock_View.jpeg', 4, '2026-01-29 06:45:10.723815', '2026-01-29 06:45:10.723815');
INSERT INTO public.product_images VALUES (553, 149, 'RG_Wing_Bracelet_Top_View.jpeg', 2, '2026-01-29 06:46:22.451334', '2026-01-29 06:46:22.451334');
INSERT INTO public.product_images VALUES (554, 149, 'RG_Wing_Bracelet_full_View.jpeg', 3, '2026-01-29 06:46:23.218736', '2026-01-29 06:46:23.218736');
INSERT INTO public.product_images VALUES (555, 149, 'RG_Wing_Bracelet_lock_View.jpeg', 4, '2026-01-29 06:46:23.811192', '2026-01-29 06:46:23.811192');
INSERT INTO public.product_images VALUES (556, 150, 'RG_Wing_Bracelet_Top_View.jpeg', 2, '2026-01-29 06:48:05.986201', '2026-01-29 06:48:05.986201');
INSERT INTO public.product_images VALUES (557, 150, 'RG_Wing_Bracelet_full_View.jpeg', 3, '2026-01-29 06:48:06.720568', '2026-01-29 06:48:06.720568');
INSERT INTO public.product_images VALUES (558, 150, 'RG_Wing_Bracelet_lock_View.jpeg', 4, '2026-01-29 06:48:08.143371', '2026-01-29 06:48:08.143371');
INSERT INTO public.product_images VALUES (559, 151, 'Royal_Blue_Stone_Necklace.jpeg', 2, '2026-01-29 15:59:35.6236', '2026-01-29 15:59:35.6236');
INSERT INTO public.product_images VALUES (560, 152, 'Royal_Blue_Necklace.jpeg', 2, '2026-01-29 16:02:17.256718', '2026-01-29 16:02:17.256718');
INSERT INTO public.product_images VALUES (561, 95, 'Infinte_Love_Necklace__studio_.jpg', 5, '2026-01-29 16:04:42.121852', '2026-01-29 16:04:42.121852');
INSERT INTO public.product_images VALUES (562, 153, 'Star_Triangle_Heart_Necklace.jpg', 2, '2026-01-29 16:16:51.524346', '2026-01-29 16:16:51.524346');
INSERT INTO public.product_images VALUES (563, 154, 'Star_Triangle_Heart_Necklace.jpg', 2, '2026-01-29 16:19:19.248452', '2026-01-29 16:19:19.248452');


--
-- Data for Name: product_relations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.product_relations VALUES (1, 3, 2, '2025-12-08 05:14:20.092979', '2025-12-08 05:14:20.092979');
INSERT INTO public.product_relations VALUES (2, 5, 4, '2025-12-08 16:15:52.443208', '2025-12-08 16:15:52.443208');
INSERT INTO public.product_relations VALUES (5, 7, 6, '2025-12-08 16:43:27.865875', '2025-12-08 16:43:27.865875');
INSERT INTO public.product_relations VALUES (6, 8, 6, '2025-12-08 16:53:30.39191', '2025-12-08 16:53:30.39191');
INSERT INTO public.product_relations VALUES (7, 8, 7, '2025-12-08 16:53:30.397211', '2025-12-08 16:53:30.397211');
INSERT INTO public.product_relations VALUES (8, 9, 2, '2025-12-08 17:03:34.978557', '2025-12-08 17:03:34.978557');
INSERT INTO public.product_relations VALUES (9, 10, 2, '2025-12-08 17:30:43.684322', '2025-12-08 17:30:43.684322');
INSERT INTO public.product_relations VALUES (10, 12, 11, '2025-12-09 06:07:22.900635', '2025-12-09 06:07:22.900635');
INSERT INTO public.product_relations VALUES (11, 15, 12, '2025-12-09 12:03:46.549892', '2025-12-09 12:03:46.549892');
INSERT INTO public.product_relations VALUES (12, 15, 14, '2025-12-09 12:03:46.556563', '2025-12-09 12:03:46.556563');
INSERT INTO public.product_relations VALUES (13, 15, 11, '2025-12-09 12:03:46.561291', '2025-12-09 12:03:46.561291');
INSERT INTO public.product_relations VALUES (14, 16, 12, '2025-12-09 12:05:57.305435', '2025-12-09 12:05:57.305435');
INSERT INTO public.product_relations VALUES (15, 16, 11, '2025-12-09 12:05:57.313021', '2025-12-09 12:05:57.313021');
INSERT INTO public.product_relations VALUES (16, 16, 15, '2025-12-09 12:05:57.318737', '2025-12-09 12:05:57.318737');
INSERT INTO public.product_relations VALUES (17, 17, 12, '2025-12-09 12:08:02.637066', '2025-12-09 12:08:02.637066');
INSERT INTO public.product_relations VALUES (18, 17, 14, '2025-12-09 12:08:02.644073', '2025-12-09 12:08:02.644073');
INSERT INTO public.product_relations VALUES (19, 17, 11, '2025-12-09 12:08:02.652246', '2025-12-09 12:08:02.652246');
INSERT INTO public.product_relations VALUES (20, 17, 15, '2025-12-09 12:08:02.660493', '2025-12-09 12:08:02.660493');
INSERT INTO public.product_relations VALUES (21, 17, 16, '2025-12-09 12:08:02.668745', '2025-12-09 12:08:02.668745');
INSERT INTO public.product_relations VALUES (25, 21, 13, '2025-12-09 13:08:02.532652', '2025-12-09 13:08:02.532652');
INSERT INTO public.product_relations VALUES (26, 21, 18, '2025-12-09 13:08:02.549112', '2025-12-09 13:08:02.549112');
INSERT INTO public.product_relations VALUES (27, 25, 24, '2025-12-10 05:41:38.174399', '2025-12-10 05:41:38.174399');
INSERT INTO public.product_relations VALUES (28, 27, 26, '2025-12-12 18:45:46.397305', '2025-12-12 18:45:46.397305');
INSERT INTO public.product_relations VALUES (29, 28, 26, '2025-12-12 19:22:50.543527', '2025-12-12 19:22:50.543527');
INSERT INTO public.product_relations VALUES (30, 28, 27, '2025-12-12 19:22:50.548328', '2025-12-12 19:22:50.548328');
INSERT INTO public.product_relations VALUES (31, 11, 15, '2025-12-13 06:50:04.395604', '2025-12-13 06:50:04.395604');
INSERT INTO public.product_relations VALUES (32, 11, 17, '2025-12-13 06:50:04.478006', '2025-12-13 06:50:04.478006');
INSERT INTO public.product_relations VALUES (33, 11, 12, '2025-12-13 06:50:04.5446', '2025-12-13 06:50:04.5446');
INSERT INTO public.product_relations VALUES (34, 33, 31, '2025-12-14 07:42:23.18694', '2025-12-14 07:42:23.18694');
INSERT INTO public.product_relations VALUES (35, 33, 32, '2025-12-14 07:42:23.193446', '2025-12-14 07:42:23.193446');
INSERT INTO public.product_relations VALUES (36, 34, 31, '2025-12-14 07:52:13.643942', '2025-12-14 07:52:13.643942');
INSERT INTO public.product_relations VALUES (37, 34, 32, '2025-12-14 07:52:13.651561', '2025-12-14 07:52:13.651561');
INSERT INTO public.product_relations VALUES (38, 34, 33, '2025-12-14 07:52:13.657404', '2025-12-14 07:52:13.657404');
INSERT INTO public.product_relations VALUES (39, 35, 31, '2025-12-14 07:56:05.23973', '2025-12-14 07:56:05.23973');
INSERT INTO public.product_relations VALUES (40, 35, 32, '2025-12-14 07:56:05.245412', '2025-12-14 07:56:05.245412');
INSERT INTO public.product_relations VALUES (41, 35, 33, '2025-12-14 07:56:05.250629', '2025-12-14 07:56:05.250629');
INSERT INTO public.product_relations VALUES (42, 35, 34, '2025-12-14 07:56:05.256275', '2025-12-14 07:56:05.256275');
INSERT INTO public.product_relations VALUES (43, 36, 31, '2025-12-14 07:59:58.523047', '2025-12-14 07:59:58.523047');
INSERT INTO public.product_relations VALUES (44, 36, 32, '2025-12-14 07:59:58.529484', '2025-12-14 07:59:58.529484');
INSERT INTO public.product_relations VALUES (45, 36, 33, '2025-12-14 07:59:58.533049', '2025-12-14 07:59:58.533049');
INSERT INTO public.product_relations VALUES (46, 36, 34, '2025-12-14 07:59:58.536703', '2025-12-14 07:59:58.536703');
INSERT INTO public.product_relations VALUES (47, 36, 35, '2025-12-14 07:59:58.54008', '2025-12-14 07:59:58.54008');
INSERT INTO public.product_relations VALUES (48, 38, 37, '2025-12-14 08:28:01.949924', '2025-12-14 08:28:01.949924');
INSERT INTO public.product_relations VALUES (49, 39, 38, '2025-12-14 08:31:51.99642', '2025-12-14 08:31:51.99642');
INSERT INTO public.product_relations VALUES (50, 39, 37, '2025-12-14 08:31:52.001749', '2025-12-14 08:31:52.001749');
INSERT INTO public.product_relations VALUES (51, 41, 40, '2025-12-15 12:53:35.945014', '2025-12-15 12:53:35.945014');
INSERT INTO public.product_relations VALUES (52, 44, 18, '2025-12-15 13:21:46.908268', '2025-12-15 13:21:46.908268');
INSERT INTO public.product_relations VALUES (53, 45, 6, '2025-12-15 13:57:34.255536', '2025-12-15 13:57:34.255536');
INSERT INTO public.product_relations VALUES (54, 46, 5, '2025-12-15 14:07:58.08815', '2025-12-15 14:07:58.08815');
INSERT INTO public.product_relations VALUES (55, 47, 46, '2025-12-15 15:31:52.239986', '2025-12-15 15:31:52.239986');
INSERT INTO public.product_relations VALUES (56, 48, 18, '2025-12-15 15:38:57.150699', '2025-12-15 15:38:57.150699');
INSERT INTO public.product_relations VALUES (57, 49, 23, '2025-12-15 15:45:55.834436', '2025-12-15 15:45:55.834436');
INSERT INTO public.product_relations VALUES (58, 6, 8, '2025-12-15 16:00:14.459004', '2025-12-15 16:00:14.459004');
INSERT INTO public.product_relations VALUES (59, 50, 11, '2025-12-15 16:08:03.566558', '2025-12-15 16:08:03.566558');
INSERT INTO public.product_relations VALUES (60, 51, 44, '2025-12-15 16:15:11.874912', '2025-12-15 16:15:11.874912');
INSERT INTO public.product_relations VALUES (62, 53, 29, '2025-12-15 17:25:05.877091', '2025-12-15 17:25:05.877091');
INSERT INTO public.product_relations VALUES (63, 55, 6, '2025-12-15 17:52:38.159485', '2025-12-15 17:52:38.159485');
INSERT INTO public.product_relations VALUES (64, 56, 55, '2025-12-15 17:57:58.497095', '2025-12-15 17:57:58.497095');
INSERT INTO public.product_relations VALUES (65, 57, 17, '2025-12-15 18:13:37.501206', '2025-12-15 18:13:37.501206');
INSERT INTO public.product_relations VALUES (66, 58, 17, '2025-12-15 18:18:27.443521', '2025-12-15 18:18:27.443521');
INSERT INTO public.product_relations VALUES (67, 59, 49, '2025-12-15 18:24:57.629809', '2025-12-15 18:24:57.629809');
INSERT INTO public.product_relations VALUES (68, 59, 53, '2025-12-15 18:24:57.634902', '2025-12-15 18:24:57.634902');
INSERT INTO public.product_relations VALUES (69, 60, 29, '2025-12-15 18:28:04.788921', '2025-12-15 18:28:04.788921');
INSERT INTO public.product_relations VALUES (70, 61, 29, '2025-12-15 18:30:04.205777', '2025-12-15 18:30:04.205777');
INSERT INTO public.product_relations VALUES (71, 90, 84, '2025-12-20 10:31:44.732914', '2025-12-20 10:31:44.732914');
INSERT INTO public.product_relations VALUES (72, 93, 16, '2026-01-13 05:45:14.047116', '2026-01-13 05:45:14.047116');
INSERT INTO public.product_relations VALUES (73, 93, 57, '2026-01-13 05:45:14.077645', '2026-01-13 05:45:14.077645');
INSERT INTO public.product_relations VALUES (74, 94, 16, '2026-01-13 05:49:07.308034', '2026-01-13 05:49:07.308034');
INSERT INTO public.product_relations VALUES (75, 94, 57, '2026-01-13 05:49:07.374938', '2026-01-13 05:49:07.374938');
INSERT INTO public.product_relations VALUES (76, 97, 96, '2026-01-22 10:05:31.261842', '2026-01-22 10:05:31.261842');
INSERT INTO public.product_relations VALUES (77, 98, 96, '2026-01-22 10:09:24.468589', '2026-01-22 10:09:24.468589');
INSERT INTO public.product_relations VALUES (78, 98, 97, '2026-01-22 10:09:24.476341', '2026-01-22 10:09:24.476341');
INSERT INTO public.product_relations VALUES (79, 99, 96, '2026-01-22 10:14:35.737205', '2026-01-22 10:14:35.737205');
INSERT INTO public.product_relations VALUES (80, 99, 98, '2026-01-22 10:14:35.746876', '2026-01-22 10:14:35.746876');
INSERT INTO public.product_relations VALUES (81, 99, 97, '2026-01-22 10:14:35.757581', '2026-01-22 10:14:35.757581');
INSERT INTO public.product_relations VALUES (82, 115, 114, '2026-01-23 17:13:55.070534', '2026-01-23 17:13:55.070534');
INSERT INTO public.product_relations VALUES (83, 128, 125, '2026-01-27 16:27:09.913016', '2026-01-27 16:27:09.913016');
INSERT INTO public.product_relations VALUES (84, 144, 129, '2026-01-29 06:25:03.425506', '2026-01-29 06:25:03.425506');


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.schema_migrations VALUES ('20251201212853');
INSERT INTO public.schema_migrations VALUES ('20251201210511');
INSERT INTO public.schema_migrations VALUES ('20251201210339');
INSERT INTO public.schema_migrations VALUES ('20251201210332');
INSERT INTO public.schema_migrations VALUES ('20251201205324');
INSERT INTO public.schema_migrations VALUES ('20251201205300');
INSERT INTO public.schema_migrations VALUES ('20251117210418');
INSERT INTO public.schema_migrations VALUES ('20251117013000');
INSERT INTO public.schema_migrations VALUES ('20251117010000');
INSERT INTO public.schema_migrations VALUES ('20251117000000');
INSERT INTO public.schema_migrations VALUES ('20251116204139');
INSERT INTO public.schema_migrations VALUES ('20251116204133');
INSERT INTO public.schema_migrations VALUES ('20251116204128');
INSERT INTO public.schema_migrations VALUES ('20251116204123');
INSERT INTO public.schema_migrations VALUES ('20251116204119');
INSERT INTO public.schema_migrations VALUES ('20251116204113');
INSERT INTO public.schema_migrations VALUES ('20251116204054');
INSERT INTO public.schema_migrations VALUES ('20251116204042');
INSERT INTO public.schema_migrations VALUES ('20251116204037');
INSERT INTO public.schema_migrations VALUES ('20251202111941');
INSERT INTO public.schema_migrations VALUES ('20251212215324');
INSERT INTO public.schema_migrations VALUES ('20251212215408');
INSERT INTO public.schema_migrations VALUES ('20251212215442');
INSERT INTO public.schema_migrations VALUES ('20251212215520');
INSERT INTO public.schema_migrations VALUES ('20251214212026');
INSERT INTO public.schema_migrations VALUES ('20251214212058');
INSERT INTO public.schema_migrations VALUES ('20251214212059');
INSERT INTO public.schema_migrations VALUES ('20251214212100');
INSERT INTO public.schema_migrations VALUES ('20251214221944');
INSERT INTO public.schema_migrations VALUES ('20251216204423');
INSERT INTO public.schema_migrations VALUES ('20251216204458');
INSERT INTO public.schema_migrations VALUES ('20251216204558');
INSERT INTO public.schema_migrations VALUES ('20251216213457');
INSERT INTO public.schema_migrations VALUES ('20251220102056');
INSERT INTO public.schema_migrations VALUES ('20260124203545');
INSERT INTO public.schema_migrations VALUES ('20260124223808');
INSERT INTO public.schema_migrations VALUES ('20260127105253');


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.settings VALUES (1, 'VENÈ JEWELRY', 11.00, 0.00, 50.00, 'USD', '+96178729590', 'Lebanon', '08ca7634-f5f4-11f0-b24c-9e141b2fa02d', '654c157e845f2ed25139becba9713127', '2025-12-01 22:59:02.683495', '2026-01-24 20:28:18.129985', true, 60, 'Pre-order items are estimated to ship within the specified timeframe. Delivery dates are estimates and not guaranteed.', 'عناصر الطلب المسبق من المقدر شحنها خلال الإطار الزمني المحدد. تواريخ التسليم تقديرية وغير مضمونة.', false);


--
-- Data for Name: user_coupons; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: wishlist_items; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.wishlist_items VALUES (5, 3, 44, NULL, 2450.00, NULL, NULL, NULL, true, true, '2026-01-27 07:40:23.736296', '2026-01-27 07:40:23.736296');


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.addresses_id_seq', 5, true);


--
-- Name: banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.banners_id_seq', 3, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 6, true);


--
-- Name: coupons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.coupons_id_seq', 1, false);


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.order_items_id_seq', 8, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orders_id_seq', 8, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pages_id_seq', 4, true);


--
-- Name: product_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_images_id_seq', 563, true);


--
-- Name: product_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_relations_id_seq', 84, true);


--
-- Name: product_variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_variants_id_seq', 295, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_id_seq', 154, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, true);


--
-- Name: sub_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sub_categories_id_seq', 23, true);


--
-- Name: user_coupons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_coupons_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: variant_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.variant_options_id_seq', 7, true);


--
-- Name: variant_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.variant_types_id_seq', 1, true);


--
-- Name: wishlist_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.wishlist_items_id_seq', 5, true);


--
-- PostgreSQL database dump complete
--

\unrestrict R04QUMvFt21pF8cEFkbUn6PsggSpht67UU25qDlF9WeLfitwwc9RxFt9FQDlcMW

