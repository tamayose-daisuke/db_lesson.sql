Q1
 CREATE TABLE departments (
    -> department_id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
    -> name VARCHAR(20) NOT NULL,
    -> created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -> updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP                                                                                
    -> );

Q2
ALTER TABLE people ADD COLUMN department_id INT unsigned AFTER email;

Q3
INSERT INTO departments (name)
-> VALUES
    -> ('営業'),
    -> ('開発'),
    -> ('経理'),
    -> ('人事'),
    -> ('情報システム');

INSERT INTO people (name, email, department_id, age, gender)
-> VALUES
    -> ('佐藤けんた', 'sato@gizumo.jp', 1, 26, 1),
    -> ('藤本ゆうこ', 'fujimoto@gizumo.jp', 1, 34, 2),
    -> ('高橋なおと', 'takahashi@gizumo.jp', 1, 43, 1),
    -> ('大西みさき', 'onishi@gizumo.jp', 2, 23 , 2),
    -> ('伊藤しょうた', 'ito@gizumo.jp', 2, 36, 1),
    -> ('渡辺あやか', 'watanabe@gizumo.jp', 2, 29, 2),
    -> ('山本だいち', 'yamamoto@gizumo.jp', 2, 24, 1),
    -> ('中村ゆい', 'nakamura@gizumo.jp', 3, 41, 2),
    -> ('小林かいと', 'kobayashi@gizumo.jp', 4, 42, 1),
    -> ('加藤ななこ', 'kato@gizumo.jp', 5, 35, 2);

INSERT INTO reports (person_id, content) 
->VALUES
    -> (7, '本日は顧客データの抽出作業を行いました。件数が多く、確認に時間を要しました。'),
    -> (8, 'SQLのJOIN句を用いた集計処理の練習を行いました。業務にも応用できそうです。'),
    -> (9, '午前中は部署ミーティング、午後は研修課題に取り組みました。'),
    -> (10, 'データベースの正規化について社内研修を受けました。理解が深まりました。'),
    -> (11, 'クエリの実行速度が遅く、インデックスの活用方法を学びました。'),
    -> (12, 'サブクエリを使用した高度な検索処理に挑戦しました。'),
    -> (13, '報告資料作成のため、過去データの分析を行いました。'),
    -> (14, '新規プロジェクトの準備として、関連情報の整理を実施しました。'),
    -> (15, 'SQL文のバグ修正を行い、無事に期待する結果が得られました。'),
    -> (16, '業務効率化のため、定型処理の自動化に関する調査を行いました。');

Q4
UPDATE people SET department_id  = 1 WHERE person_id = 1;
UPDATE people SET department_id  = 1 WHERE person_id = 2;
UPDATE people SET department_id  = 2 WHERE person_id = 3;
UPDATE people SET department_id  = 3 WHERE person_id = 4;
UPDATE people SET department_id  = 4 WHERE person_id = 6;

Q5
SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC; 

Q6
SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;
->peopleテーブルの中から、department_idのレコードが1となっているデータを、created_atの降順でname、email、ageのカラムのデータの取得をしてください。

Q7
SELECT name FROM people WHERE (gender = '2' AND age BETWEEN 20 AND 29) OR (gender = '1' AND age BETWEEN 40 AND 49);

Q8
SELECT * FROM people WHERE department_id = 1 ORDER BY age ASC;

Q9
SELECT AVG(age) AS average_age FROM people WHERE department_id = 2 AND gender = 2;

Q10
SELECT p.name, d.name, r.content FROM people p INNER JOIN departments d ON p.department_id = d.department_id INNER JOIN reports r ON p.person_id = r.person_id ;

Q11
SELECT p.name FROM people p LEFT OUTER JOIN reports r USING (person_id) WHERE content IS NULL;