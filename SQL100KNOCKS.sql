-- S-001: レシート明細データ（receipt）から全項目の先頭10件を表示し、どのようなデータを保有しているか目視で確認せよ。
SELECT * FROM receipt LIMIT 10;

-- S-002: レシート明細データ（receipt）から売上年月日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、10件表示せよ。
SELECT sales_ymd, customer_id, product_cd, amount FROM receipt LIMIT 10;

-- S-003: レシート明細データ（receipt）から売上年月日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、10件表示せよ。ただし、sales_ymdをsales_dateに項目名を変更しながら抽出すること。
SELECT sales_ymd as sales_date, customer_id, product_cd, amount FROM receipt LIMIT 10;

-- S-004: レシート明細データ（receipt）から売上日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、以下の条件を満たすデータを抽出せよ。
-- 顧客ID（customer_id）が”CS018205000001”
SELECT sales_ymd, customer_id, product_cd, amount FROM receipt 
WHERE customer_id='CS018205000001';

-- S-005: レシート明細データ（receipt）から売上日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、以下の全ての条件を満たすデータを抽出せよ。
-- 顧客ID（customer_id）が”CS018205000001”
-- 売上金額（amount）が1,000以上
SELECT sales_ymd, customer_id, product_cd, amount FROM receipt 
WHERE customer_id='CS018205000001' AND amount>=1000;

-- S-006: レシート明細データ（receipt）から売上日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上数量（quantity）、売上金額（amount）の順に列を指定し、以下の全ての条件を満たすデータを抽出せよ。
-- 顧客ID（customer_id）が"CS018205000001”
-- 売上金額（amount）が1,000以上または売上数量（quantity）が5以上
SELECT sales_ymd, customer_id, product_cd, quantity, amount FROM receipt
WHERE customer_id='CS018205000001' AND (amount>=1000 OR quantity>=5);

-- S-007: レシート明細データ（receipt）から売上日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、以下の全ての条件を満たすデータを抽出せよ。
-- 顧客ID（customer_id）が"CS018205000001"
-- 売上金額（amount）が1,000以上2,000以下
SELECT sales_ymd, customer_id, product_cd, amount FROM receipt
WHERE customer_id='CS018205000001' AND amount>=1000 AND amount<=2000;
    -- 「amount>=1000 AND amount<=2000」と分けて書いてしまったが、解答では「amount BETWEEN 1000 AND 2000」

-- S-008: レシート明細データ（receipt）から売上日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、以下の全ての条件を満たすデータを抽出せよ。
-- 顧客ID（customer_id）が"CS018205000001”
-- 商品コード（product_cd）が"P071401019"以外
SELECT sales_ymd, customer_id, product_cd, amount FROM receipt
WHERE customer_id='CS018205000001' AND product_cd<>'P071401019';
    -- 解答では「<>」でなく「!=」

-- S-009: 以下の処理において、出力結果を変えずにORをANDに書き換えよ。
-- SELECT * FROM store WHERE NOT (prefecture_cd = '13' OR floor_area > 900)
SELECT * FROM store WHERE (prefecture_cd<>'13' AND floor_area<=900)
    -- 解答では「<>」でなく「!=」

-- S-010: 店舗データ（store）から、店舗コード（store_cd）が"S14"で始まるものだけ全項目抽出し、10件表示せよ。
SELECT * FROM store WHERE store_cd LIKE 'S14%' LIMIT 10;
        
-- S-011: 顧客データ（customer）から顧客ID（customer_id）の末尾が1のものだけ全項目抽出し、10件表示せよ。
SELECT * FROM customer WHERE customer_id LIKE '%1' LIMIT 10;

-- S-012: 店舗データ（store）から、住所 (address) に"横浜市"が含まれるものだけ全項目表示せよ。
SELECT * FROM store WHERE address LIKE '%横浜市%';

-- S-013: 顧客データ（customer）から、ステータスコード（status_cd）の先頭がアルファベットのA〜Fで始まるデータを全項目抽出し、10件表示せよ。
SELECT * FROM customer WHERE status_cd ~'^[A-F]' LIMIT 10;
    -- 書き方忘れていたので調べたまま書いた

-- S-014: 顧客データ（customer）から、ステータスコード（status_cd）の末尾が数字の1〜9で終わるデータを全項目抽出し、10件表示せよ。
SELECT * FROM customer WHERE status_cd ~'[1-9]$' LIMIT 10;
    -- 書き方忘れていたので調べたまま書いた

-- S-015: 顧客データ（customer）から、ステータスコード（status_cd）の先頭がアルファベットのA〜Fで始まり、末尾が数字の1〜9で終わるデータを全項目抽出し、10件表示せよ。
SELECT * FROM customer WHERE status_cd ~'^[A-F].*[1-9]$' LIMIT 10;
    -- 書き方忘れていたので調べたまま書いた

-- S-016: 店舗データ（store）から、電話番号（tel_no）が3桁-3桁-4桁のデータを全項目表示せよ。
SELECT * FROM store WHERE tel_no ~'^[0-9]{3}[-]?[0-9]{3}[-]?[0-9]{4}';
    -- 書き方忘れていたので調べたまま書いた
    -- 解答は「tel_no ~ '^[0-9]{3}-[0-9]{3}-[0-9]{4}$'」

-- S-017: 顧客データ（customer）を生年月日（birth_day）で高齢順にソートし、先頭から全項目を10件表示せよ。
SELECT * FROM customer ORDER BY birth_day LIMIT 10;

-- S-018: 顧客データ（customer）を生年月日（birth_day）で若い順にソートし、先頭から全項目を10件表示せよ。
SELECT * FROM customer ORDER BY birth_day DESC LIMIT 10;

-- S-019: レシート明細データ（receipt）に対し、1件あたりの売上金額（amount）が高い順にランクを付与し、先頭から10件表示せよ。項目は顧客ID（customer_id）、売上金額（amount）、付与したランクを表示させること。なお、売上金額（amount）が等しい場合は同一順位を付与するものとする。
SELECT customer_id, amount, RANK() OVER(ORDER BY amount DESC) FROM receipt LIMIT 10;
    -- rankの書き方忘れていたので調べた
    -- 解答では「AS ranking」でカラム名をつけていた

-- S-020: レシート明細データ（receipt）に対し、1件あたりの売上金額（amount）が高い順にランクを付与し、先頭から10件表示せよ。項目は顧客ID（customer_id）、売上金額（amount）、付与したランクを表示させること。なお、売上金額（amount）が等しい場合でも別順位を付与すること。
SELECT customer_id, amount, ROW_NUMBER() OVER(ORDER BY amount DESC) AS rank FROM receipt LIMIT 10;

-- S-021: レシート明細データ（receipt）に対し、件数をカウントせよ。
SELECT COUNT(*) FROM receipt;

-- S-022: レシート明細データ（receipt）の顧客ID（customer_id）に対し、ユニーク件数をカウントせよ。
SELECT COUNT(DISTINCT customer_id) FROM receipt;
    -- 全くわからなくて調べた

-- S-023: レシート明細データ（receipt）に対し、店舗コード（store_cd）ごとに売上金額（amount）と売上数量（quantity）を合計せよ。
SELECT store_cd, SUM(amount) AS amount, SUM(quantity) AS quantity FROM receipt GROUP BY store_cd;

-- S-024: レシート明細データ（receipt）に対し、顧客ID（customer_id）ごとに最も新しい売上年月日（sales_ymd）を求め、10件表示せよ。
SELECT customer_id, MAX(sales_ymd) AS sales_ymd FROM receipt GROUP BY customer_id LIMIT 10;

-- S-025: レシート明細データ（receipt）に対し、顧客ID（customer_id）ごとに最も古い売上年月日（sales_ymd）を求め、10件表示せよ。
SELECT customer_id, MIN(sales_ymd) AS sales_ymd FROM receipt GROUP BY customer_id LIMIT 10;

-- S-026: レシート明細データ（receipt）に対し、顧客ID（customer_id）ごとに最も新しい売上年月日（sales_ymd）と古い売上年月日を求め、両者が異なるデータを10件表示せよ。
SELECT * FROM
(SELECT customer_id, MAX(sales_ymd), MIN(sales_ymd) FROM receipt GROUP BY customer_id) receipt_v
WHERE receipt_v.MAX<>receipt_v.MIN LIMIT 10;
    -- 「HAVING」を思い出せず、副問い合わせを使用してしまった
    -- 解答では「HAVING MAX(sales_ymd) != MIN(sales_ymd)」で済む

-- S-027: レシート明細データ（receipt）に対し、店舗コード（store_cd）ごとに売上金額（amount）の平均を計算し、降順でTOP5を表示せよ。
SELECT store_cd, avg(amount) FROM receipt
GROUP BY store_cd ORDER BY avg(amount) DESC LIMIT 5;
    -- 解答では「AVG(amount) AS avg_amount」で項目名つけてた

-- S-028: レシート明細データ（receipt）に対し、店舗コード（store_cd）ごとに売上金額（amount）の中央値を計算し、降順でTOP5を表示せよ。
SELECT
    store_cd,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY amount) as median
FROM receipt
GROUP BY store_cd
ORDER BY median DESC
LIMIT 5;
    -- 中央値がわからなくて調べて書いた

-- S-029: レシート明細データ（receipt）に対し、店舗コード（store_cd）ごとに商品コード（product_cd）の最頻値を求め、10件表示させよ。
WITH product_cnt AS (
    SELECT
        store_cd,
        product_cd,
        COUNT(1) AS mode_cnt
    FROM receipt
    GROUP BY store_cd, product_cd
),
product_mode AS (
    SELECT
        store_cd,
        product_cd,
        mode_cnt,
        RANK() OVER(PARTITION BY store_cd ORDER BY mode_cnt DESC) AS rnk
    FROM product_cnt
)
SELECT
    store_cd,
    product_cd,
    mode_cnt
FROM product_mode
WHERE rnk = 1
ORDER BY
    store_cd,
    product_cd
LIMIT 10;
    -- 最頻値がわからない・書き方がわからず、解答を見ながら書いて動かした
    -- WITH句見やすいので使うようにしたい
        
-- S-030: レシート明細データ（receipt）に対し、店舗コード（store_cd）ごとに売上金額（amount）の分散を計算し、降順で5件表示せよ。
SELECT s.store_cd, sum(s.dou)/count(s.amount) s2
FROM (
    SELECT 
        m.store_cd, 
        m.amount,
        a.average,
        (a.average-m.amount) de,
        (a.average-m.amount)*(a.average-m.amount) dou
    FROM receipt m
    JOIN (SELECT store_cd, avg(amount) average FROM receipt GROUP by store_cd) a
    ON m.store_cd = a.store_cd
    ) s
GROUP BY store_cd
ORDER BY s2 DESC
LIMIT 5;
    -- 分散は「VAR_POP(amount) AS vars_amount」で計算
    -- 調べずやってしまったので、複雑に書いてしまった

-- S-031: レシート明細データ（receipt）に対し、店舗コード（store_cd）ごとに売上金額（amount）の標準偏差を計算し、降順で5件表示せよ。
SELECT
    store_cd,
    STDDEV_POP(amount) as stds_amount
FROM receipt
GROUP BY store_cd
ORDER BY stds_amount DESC
LIMIT 5;
    -- 調べて取り組んだが、回答時は標本標準偏差「STDDEV_SAMP」を使用してしまい間違い
    -- 問題文に「レシート明細データ（receipt）に対し」と明記されているから、母標準偏差を使用？？

-- S-032: レシート明細データ（receipt）の売上金額（amount）について、25％刻みでパーセンタイル値を求めよ。
SELECT
    PERCENTILE_CONT(0.25) WITHIN GROUP(ORDER BY amount) AS amount_25per,
    PERCENTILE_CONT(0.50) WITHIN GROUP(ORDER BY amount) AS amount_50per,
    PERCENTILE_CONT(0.75) WITHIN GROUP(ORDER BY amount) AS amount_75per,
    PERCENTILE_CONT(1.0) WITHIN GROUP(ORDER BY amount) AS amount_100per
FROM receipt;
    -- そもそもパーセンタイル値がわからなかったので、解答を見つつ調べつつ動かした

-- S-033: レシート明細データ（receipt）に対し、店舗コード（store_cd）ごとに売上金額（amount）の平均を計算し、330以上のものを抽出せよ。
SELECT store_cd, AVG(amount) FROM receipt
GROUP BY store_cd HAVING AVG(amount)>=330;

-- S-034: レシート明細データ（receipt）に対し、顧客ID（customer_id）ごとに売上金額（amount）を合計して全顧客の平均を求めよ。ただし、顧客IDが"Z"から始まるものは非会員を表すため、除外して計算すること。
WITH total AS(
SELECT customer_id, SUM(amount) AS customer_amount 
FROM receipt GROUP BY customer_id
)
SELECT AVG(customer_amount) FROM total WHERE customer_id NOT LIKE 'Z%';
    -- 解答は、顧客IDの条件をWITH句内で付けていた

-- S-035: レシート明細データ（receipt）に対し、顧客ID（customer_id）ごとに売上金額（amount）を合計して全顧客の平均を求め、平均以上に買い物をしている顧客を抽出し、10件表示せよ。ただし、顧客IDが"Z"から始まるものは非会員を表すため、除外して計算すること。
WITH total AS(
    SELECT customer_id, SUM(amount) AS customer_amount FROM receipt
    WHERE customer_id NOT LIKE 'Z%' GROUP BY customer_id
),
average AS(
    SELECT AVG(customer_amount) AS average_amount FROM total
)
SELECT customer_id, customer_amount FROM total
WHERE customer_amount>=(SELECT average_amount FROM average)
LIMIT 10;
    -- 解答では、WITH句１つだけで、WHEREのSELECTにAVG書いてる

-- S-036: レシート明細データ（receipt）と店舗データ（store）を内部結合し、レシート明細データの全項目と店舗データの店舗名（store_name）を10件表示せよ。
SELECT receipt.*, store.store_name FROM receipt
JOIN store ON receipt.store_cd=store.store_cd
LIMIT 10;

-- S-037: 商品データ（product）とカテゴリデータ（category）を内部結合し、商品データの全項目とカテゴリデータのカテゴリ小区分名（category_small_name）を10件表示せよ。
SELECT product.*, category.category_small_name FROM product
JOIN category
ON product.category_small_cd=category.category_small_cd
LIMIT 10;