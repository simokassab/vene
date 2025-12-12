page = Page.find(1)

content_en = <<~CONTENT_EN
  <h1>Terms and Conditions</h1>
  <p><strong>Effective Date:</strong> December 07, 2025</p>
  <p><strong>Company Name:</strong> VENÈ JEWELRY</p>

  <p>Welcome to VENÈ. These Terms and Conditions govern your use of our services, website, and purchases from our brand. Customers must be 18 years or older to make a purchase on our website. By engaging with VENÈ, you agree to the following terms:</p>

  <h2>1. General</h2>
  <p>The content of this website is for your general information and use only. It is subject to change without notice. VENÈ specializes in designing and selling fine jewelry, including bespoke (custom-made) pieces and original designs.</p>
  <p>By purchasing from VENÈ, you acknowledge that you have read and understood these Terms.</p>

  <h2>2. Orders & Custom Designs</h2>
  <ul>
    <li>Custom jewelry is created according to the client's specifications. Once a custom design has been approved and confirmed, it cannot be altered or canceled.</li>
    <li>30% non-refundable deposit is required to initiate any custom jewelry piece.</li>
    <li>The final 70% payment is due prior to delivery or pickup of the completed order.</li>
    <li>VENÈ provides design visuals or illustrations upon request. These serve as a representation and may differ slightly from the final handcrafted product.</li>
    <li>Ready-made designs are subject to availability and may be limited in quantity.</li>
  </ul>

  <h2>3. Pre-Order Jewelry</h2>
  <p>By placing a pre-order with VENÈ, you agree to the following terms:</p>

  <h3>Payment & Order Confirmation</h3>
  <p>All pre-orders must be paid in full at the time of purchase unless otherwise stated. Your order is confirmed only once payment is successfully received.</p>

  <h3>Estimated Delivery Time</h3>
  <p>Pre-order items are not in stock. Estimated delivery dates are provided based on our production schedule, but they are not guaranteed. Delays may occur due to manufacturing, shipping, or customs.</p>

  <h3>Production Variations</h3>
  <p>Slight variations in color, materials, or finishing may occur due to manufacturing processes. These are not considered defects.</p>

  <h3>Cancellations & Refunds</h3>
  <ul>
    <li>Pre-orders are non-refundable and cannot be canceled once placed, as production begins specifically based on customer orders.</li>
    <li>In rare cases where the product cannot be produced or delivered, the customer will receive a full refund.</li>
  </ul>

  <h3>Changes to Orders</h3>
  <p>Requests to change sizes, colors, or product selections after placing a pre-order cannot be guaranteed. Changes depend on production stage and stock availability.</p>

  <h3>Shipping & Customs</h3>
  <p>Once the item is ready, it will be shipped according to the shipping method selected at checkout. Any customs duties or taxes are the customer's responsibility.</p>

  <h3>Combined Orders</h3>
  <p>If a pre-order item is purchased together with in-stock items, the entire order may be shipped together once the pre-order item is available, unless stated otherwise.</p>

  <h3>Communication & Updates</h3>
  <p>Customers will receive periodic updates regarding production and delivery timelines. You may contact us at any time for order status.</p>

  <h2>4. Pricing & Payment</h2>
  <ul>
    <li>All prices are quoted in USD and include applicable taxes unless stated otherwise.</li>
    <li>All orders are subject to product availability and acceptance.</li>
    <li>Payments must be completed using the methods provided at checkout.</li>
    <li>VENÈ reserves the right to update prices at any time without prior notice.</li>
    <li>Full payment or a deposit (as agreed) is required before work begins on custom orders. Remaining balances must be settled prior to delivery.</li>
    <li>All pre-orders must be paid in full at the time of purchase unless stated otherwise.</li>
  </ul>

  <h2>5. Shipping & Delivery</h2>
  <ul>
    <li>Shipping timelines will be communicated upon order confirmation and will take up to 15 days for jewelries in stock and 4-6 weeks for custom orders.</li>
    <li>Delivery times may vary depending on location and production schedules.</li>
    <li>VENÈ is not responsible for delays caused by couriers, customs, or unforeseen circumstances (Force Majeure) beyond our control.</li>
    <li>All shipments are insured until delivery. Clients are required to inspect items immediately upon receipt.</li>
  </ul>

  <h2>6. Returns & Exchanges</h2>
  <ul>
    <li>Due to the bespoke nature of custom jewelry, returns or exchanges are not accepted on custom orders.</li>
    <li>Ready-made jewelry may be eligible for exchange within 7 days of purchase if unworn, undamaged, and in original packaging.</li>
    <li>Refunds are issued only at VENÈ's discretion and in accordance with consumer protection laws.</li>
  </ul>

  <h2>7. Warranty & Repairs</h2>
  <ul>
    <li>VENÈ guarantees the authenticity of all materials used (gold, diamonds, gemstones).</li>
    <li>Manufacturing defects reported within 7 days of purchase will be repaired free of charge.</li>
    <li>Damage caused by misuse, accidents, or normal wear and tear is not covered under warranty, but repair services may be offered at a cost.</li>
  </ul>

  <h2>8. Intellectual Property</h2>
  <ul>
    <li>All designs, sketches, and concepts created by VENÈ remain the intellectual property of VENÈ unless otherwise agreed in writing.</li>
    <li>Clients may not reproduce, copy, or resell VENÈ's designs without prior written consent.</li>
  </ul>

  <h2>9. Liability</h2>
  <ul>
    <li>VENÈ shall not be liable for indirect, incidental, or consequential damages arising from use of our products.</li>
    <li>Responsibility is limited to the value of the item purchased.</li>
    <li>We are not liable for any direct or indirect damages arising from the use of this website.</li>
    <li>Your use of any information or materials on this website is entirely at your own risk.</li>
  </ul>

  <h2>10. Privacy</h2>
  <p>VENÈ respects client confidentiality and protects all personal information provided. Information is only used for fulfilling orders, communications, and legal compliance.</p>
  <p>We do not sell, trade, or rent your personal information to third parties. However, we may share your information with trusted third parties, such as:</p>
  <ul>
    <li>Delivery partners to fulfill and deliver your orders.</li>
    <li>Payment processors to securely process your transactions.</li>
    <li>Service providers that help us operate our website or improve our services (e.g., analytics providers).</li>
    <li>Legal authorities when required by law or to protect our rights and safety.</li>
  </ul>

  <h2>11. Governing Law</h2>
  <p>These Terms are governed by the laws of Lebanon. Any disputes shall be resolved exclusively in the courts of Lebanon.</p>

  <h2>12. Contact Information</h2>
  <p>For questions or concerns regarding these Terms, please contact us at:</p>
  <ul>
    <li><strong>Email:</strong> venejewelry25@gmail.com</li>
    <li><strong>Phone:</strong> +96178729590</li>
  </ul>
CONTENT_EN

content_ar = <<~CONTENT_AR
  <h1>الشروط والأحكام</h1>
  <p><strong>تاريخ السريان:</strong> 7 ديسمبر 2025</p>
  <p><strong>اسم الشركة:</strong> VENÈ JEWELRY</p>

  <p>مرحباً بك في VENÈ. تحكم هذه الشروط والأحكام استخدامك لخدماتنا وموقعنا الإلكتروني ومشترياتك من علامتنا التجارية. يجب أن يكون عمر العملاء 18 عاماً أو أكثر لإجراء عملية شراء على موقعنا الإلكتروني. من خلال التعامل مع VENÈ، فإنك توافق على الشروط التالية:</p>

  <h2>1. عام</h2>
  <p>محتوى هذا الموقع مخصص لمعلوماتك العامة واستخدامك فقط. وهو عرضة للتغيير دون إشعار. تتخصص VENÈ في تصميم وبيع المجوهرات الفاخرة، بما في ذلك القطع المخصصة (المصنوعة حسب الطلب) والتصاميم الأصلية.</p>
  <p>من خلال الشراء من VENÈ، فإنك تقر بأنك قد قرأت وفهمت هذه الشروط.</p>

  <h2>2. الطلبات والتصاميم المخصصة</h2>
  <ul>
    <li>يتم إنشاء المجوهرات المخصصة وفقاً لمواصفات العميل. بمجرد الموافقة على التصميم المخصص وتأكيده، لا يمكن تغييره أو إلغاؤه.</li>
    <li>يلزم دفع وديعة غير قابلة للاسترداد بنسبة 30٪ لبدء أي قطعة مجوهرات مخصصة.</li>
    <li>يستحق دفع نسبة 70٪ النهائية قبل التسليم أو استلام الطلب المكتمل.</li>
    <li>تقدم VENÈ رسومات أو صور توضيحية للتصميم عند الطلب. تعمل هذه كتمثيل وقد تختلف قليلاً عن المنتج النهائي المصنوع يدوياً.</li>
    <li>التصاميم الجاهزة تخضع للتوفر وقد تكون محدودة الكمية.</li>
  </ul>

  <h2>3. مجوهرات الطلب المسبق</h2>
  <p>من خلال وضع طلب مسبق مع VENÈ، فإنك توافق على الشروط التالية:</p>

  <h3>الدفع وتأكيد الطلب</h3>
  <p>يجب دفع جميع الطلبات المسبقة بالكامل في وقت الشراء ما لم ينص على خلاف ذلك. يتم تأكيد طلبك فقط بعد استلام الدفع بنجاح.</p>

  <h3>وقت التسليم المقدر</h3>
  <p>عناصر الطلب المسبق غير متوفرة في المخزون. يتم توفير تواريخ التسليم المقدرة بناءً على جدول الإنتاج لدينا، لكنها غير مضمونة. قد تحدث تأخيرات بسبب التصنيع أو الشحن أو الجمارك.</p>

  <h3>تنوعات الإنتاج</h3>
  <p>قد تحدث اختلافات طفيفة في اللون أو المواد أو التشطيب بسبب عمليات التصنيع. لا تعتبر هذه عيوباً.</p>

  <h3>الإلغاءات والمبالغ المستردة</h3>
  <ul>
    <li>الطلبات المسبقة غير قابلة للاسترداد ولا يمكن إلغاؤها بمجرد تقديمها، حيث يبدأ الإنتاج خصيصاً بناءً على طلبات العملاء.</li>
    <li>في حالات نادرة حيث لا يمكن إنتاج المنتج أو تسليمه، سيحصل العميل على استرداد كامل.</li>
  </ul>

  <h3>التغييرات على الطلبات</h3>
  <p>لا يمكن ضمان طلبات تغيير الأحجام أو الألوان أو اختيارات المنتج بعد وضع طلب مسبق. تعتمد التغييرات على مرحلة الإنتاج وتوافر المخزون.</p>

  <h3>الشحن والجمارك</h3>
  <p>بمجرد أن يكون العنصر جاهزاً، سيتم شحنه وفقاً لطريقة الشحن المحددة عند الدفع. أي رسوم جمركية أو ضرائب هي مسؤولية العميل.</p>

  <h3>الطلبات المجمعة</h3>
  <p>إذا تم شراء عنصر طلب مسبق مع عناصر متوفرة في المخزون، فقد يتم شحن الطلب بأكمله معاً بمجرد توفر عنصر الطلب المسبق، ما لم ينص على خلاف ذلك.</p>

  <h3>التواصل والتحديثات</h3>
  <p>سيتلقى العملاء تحديثات دورية بخصوص الإنتاج والجداول الزمنية للتسليم. يمكنك الاتصال بنا في أي وقت لمعرفة حالة الطلب.</p>

  <h2>4. التسعير والدفع</h2>
  <ul>
    <li>جميع الأسعار معروضة بالدولار الأمريكي وتشمل الضرائب المطبقة ما لم ينص على خلاف ذلك.</li>
    <li>جميع الطلبات تخضع لتوافر المنتج والقبول.</li>
    <li>يجب إتمام الدفع باستخدام الطرق المتوفرة عند الدفع.</li>
    <li>تحتفظ VENÈ بالحق في تحديث الأسعار في أي وقت دون إشعار مسبق.</li>
    <li>يلزم الدفع الكامل أو الوديعة (كما هو متفق عليه) قبل بدء العمل على الطلبات المخصصة. يجب تسوية الأرصدة المتبقية قبل التسليم.</li>
    <li>يجب دفع جميع الطلبات المسبقة بالكامل في وقت الشراء ما لم ينص على خلاف ذلك.</li>
  </ul>

  <h2>5. الشحن والتسليم</h2>
  <ul>
    <li>سيتم الإبلاغ عن الجداول الزمنية للشحن عند تأكيد الطلب وستستغرق ما يصل إلى 15 يوماً للمجوهرات المتوفرة في المخزون و4-6 أسابيع للطلبات المخصصة.</li>
    <li>قد تختلف أوقات التسليم حسب الموقع وجداول الإنتاج.</li>
    <li>VENÈ غير مسؤولة عن التأخيرات الناجمة عن شركات البريد السريع أو الجمارك أو الظروف غير المتوقعة (القوة القاهرة) الخارجة عن سيطرتنا.</li>
    <li>جميع الشحنات مؤمنة حتى التسليم. يُطلب من العملاء فحص العناصر فوراً عند الاستلام.</li>
  </ul>

  <h2>6. المرتجعات والاستبدالات</h2>
  <ul>
    <li>نظراً للطبيعة المخصصة للمجوهرات المصنوعة حسب الطلب، لا يتم قبول المرتجعات أو الاستبدالات على الطلبات المخصصة.</li>
    <li>قد تكون المجوهرات الجاهزة مؤهلة للاستبدال في غضون 7 أيام من الشراء إذا كانت غير مستخدمة وغير تالفة وفي العبوة الأصلية.</li>
    <li>يتم إصدار المبالغ المستردة فقط وفقاً لتقدير VENÈ ووفقاً لقوانين حماية المستهلك.</li>
  </ul>

  <h2>7. الضمان والإصلاحات</h2>
  <ul>
    <li>تضمن VENÈ أصالة جميع المواد المستخدمة (الذهب والماس والأحجار الكريمة).</li>
    <li>سيتم إصلاح عيوب التصنيع المبلغ عنها في غضون 7 أيام من الشراء مجاناً.</li>
    <li>الأضرار الناجمة عن سوء الاستخدام أو الحوادث أو التآكل الطبيعي غير مشمولة بالضمان، ولكن قد يتم تقديم خدمات الإصلاح بتكلفة.</li>
  </ul>

  <h2>8. الملكية الفكرية</h2>
  <ul>
    <li>جميع التصاميم والرسومات والمفاهيم التي أنشأتها VENÈ تظل ملكية فكرية لـ VENÈ ما لم يتم الاتفاق على خلاف ذلك كتابياً.</li>
    <li>لا يجوز للعملاء إعادة إنتاج أو نسخ أو إعادة بيع تصاميم VENÈ دون موافقة خطية مسبقة.</li>
  </ul>

  <h2>9. المسؤولية</h2>
  <ul>
    <li>VENÈ غير مسؤولة عن الأضرار غير المباشرة أو العرضية أو التبعية الناشئة عن استخدام منتجاتنا.</li>
    <li>المسؤولية محدودة بقيمة العنصر المشترى.</li>
    <li>نحن غير مسؤولين عن أي أضرار مباشرة أو غير مباشرة ناشئة عن استخدام هذا الموقع.</li>
    <li>استخدامك لأي معلومات أو مواد على هذا الموقع هو على مسؤوليتك الخاصة بالكامل.</li>
  </ul>

  <h2>10. الخصوصية</h2>
  <p>تحترم VENÈ سرية العملاء وتحمي جميع المعلومات الشخصية المقدمة. يتم استخدام المعلومات فقط لتنفيذ الطلبات والاتصالات والامتثال القانوني.</p>
  <p>نحن لا نبيع أو نتاجر أو نؤجر معلوماتك الشخصية لأطراف ثالثة. ومع ذلك، قد نشارك معلوماتك مع أطراف ثالثة موثوقة، مثل:</p>
  <ul>
    <li>شركاء التوصيل لتنفيذ وتسليم طلباتك.</li>
    <li>معالجات الدفع لمعالجة معاملاتك بشكل آمن.</li>
    <li>مقدمو الخدمات الذين يساعدوننا في تشغيل موقعنا أو تحسين خدماتنا (مثل مقدمي التحليلات).</li>
    <li>السلطات القانونية عند الطلب بموجب القانون أو لحماية حقوقنا وسلامتنا.</li>
  </ul>

  <h2>11. القانون الحاكم</h2>
  <p>تخضع هذه الشروط لقوانين لبنان. يتم حل أي نزاعات حصرياً في محاكم لبنان.</p>

  <h2>12. معلومات الاتصال</h2>
  <p>للأسئلة أو المخاوف المتعلقة بهذه الشروط، يرجى الاتصال بنا على:</p>
  <ul>
    <li><strong>البريد الإلكتروني:</strong> venejewelry25@gmail.com</li>
    <li><strong>الهاتف:</strong> +96178729590</li>
  </ul>
CONTENT_AR

page.update!(
  content_en: content_en,
  content_ar: content_ar
)

puts "✓ Terms and Conditions page updated successfully!"
puts "  - English content: #{content_en.length} characters"
puts "  - Arabic content: #{content_ar.length} characters"
