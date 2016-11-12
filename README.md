# Ruby on Rails による蔵書管理(v.0.1.0)

Ruby on Railsの練習用に作成した書籍管理システムです。自分が購入した書籍の購入価格や未読などを管理できます。書籍データは、著者と出版社のテーブルを参照しています。このため書籍データを登録する前に、著者と出版社を登録する必要があります。

##  動作確認環境

1. OS : macOS Sierra v.10.12.1
2. Ruby : 2.3.1
3. Rails : 4.2.2
4. Bundler : 1.13.6
5. Git : 2.10.1

##  ダウンロードと起動方法

```
  $ git clone https://github.com/ht0919/booklist.git booklist
  $ cd booklist
  $ bin/rails s
```

## アクセス方法

1. ブラウザを起動
2. アドレス欄に「http://localhost:3000/」と入力して書籍一覧を表示

## データベースの構造

1. 著者マスター(auther) → 著者名
2. 出版社マスター(publisher) → 出版社
3. 書籍データ(book) → タイトル、著者ID、出版社ID、発行日、定価、ISBN、購入日、購入価格、読了

## ===== 作成手順の記録 =====

### プロジェクトの作成

```
  $ rails new booklist
  $ cd booklist
```
### Gemファイルの編集

- テキストエディタでGemfileを開いて下記のように編集する

```
source 'https://rubygems.org'

gem 'rails',        '4.2.2'
gem 'sass-rails',   '5.0.2'
gem 'uglifier',     '2.5.3'
gem 'coffee-rails', '4.1.0'
gem 'jquery-rails', '4.0.3'
gem 'turbolinks',   '2.3.0'
gem 'jbuilder',     '2.2.3'
gem 'sdoc',         '0.4.0', group: :doc

group :development, :test do
  gem 'sqlite3',      '1.3.9'
  gem 'byebug',       '3.4.0'
  gem 'web-console',  '2.0.0.beta3'
  gem 'spring',       '1.1.3'
end
```

### gemのインストール

- $ bundle install

### スキャッフォルドの作成

```
  $ bin/rails g scaffold auther name:string
  $ bin/rails g scaffold publisher name:string
  $ bin/rails g scaffold book title:string auther:references publisher:references published:date price:integer isbn:string p_date:date p_price:integer read:boolean
```

### データベースの作成

```
  $ bin/rake db:migrate
```

### Gitの初期化

```
  $ git init
  $ git add -A
  $ git commit -m "Initialize repository"
  $ git status
```

### GitHubに登録(※Webで「booklist」リポジトリを作成後に実行)

  1. $ git remote add origin https://github.com/ユーザID/booklist.git
  2. $ git push origin master
    - ユーザIDとパスワードの入力(※エコーバックされないので注意して入力)

### newで著者名と出版社名をセレクタに変更

- app/views/books/_form.html.erbの修正(18-25)

```
  <div class="field">
    <%= f.label :auther_id %>
    <%= f.collection_select( :auther_id, Auther.all, :id, :name) %>
  </div>
  <div class="field">
    <%= f.label :publisher_id %>
    <%= f.collection_select( :publisher_id, Publisher.all, :id, :name) %>
  </div>
```

- GitHubにPush

```
  $ git add -A
  $ git commit -m "Chg View New and Edit"
  $ git status
  $ git push origin master
```

### indexで著者名と出版社名を表示

- app/views/books/index.html.erbの修正(25-26)

```
  <td><%= book.auther.name %></td>
  <td><%= book.publisher.name %></td>
```

- GitHubにPush

```
  $ git add -A
  $ git commit -m "Chg View Index"
  $ git status
  $ git push origin master
```

### Viewで著者名と出版社名を表示

- app/views/books/show.html.erbの修正(8-16)

```
  <p>
    <strong>Auther:</strong>
    <%= @book.auther.name %>
  </p>

  <p>
    <strong>Publisher:</strong>
    <%= @book.publisher.name %>
  </p>
```
- GitHubにPush

```
  $ git add -A
  $ git commit -m "Chg View Show Author,Publisher"
  $ git status
  $ git push origin master
```

### Railsで日本語化対応にする方法

- http://qiita.com/kusu_tweet/items/b534c808ac1ee0382f05

### ラベルの日本語化（書籍管理）

1. app/views/books/index.html.erbの修正
2. app/views/books/show.html.erbの修正
3. app/views/books/_form.html.erbの修正
4. app/views/books/edit.html.erbの修正
5. app/views/books/new.html.erbの修正

### ラベルの日本語化（著者管理）

1. app/views/authers/index.html.erbの修正
2. app/views/authers/show.html.erbの修正
3. app/views/authers/_form.html.erbの修正
4. app/views/authers/edit.html.erbの修正
5. app/views/authers/new.html.erbの修正

### ラベルの日本語化（版元管理）

1. app/views/publishers/index.html.erbの修正
2. app/views/publishers/show.html.erbの修正
3. app/views/publishers/_form.html.erbの修正
4. app/views/publishers/edit.html.erbの修正
5. app/views/publishers/new.html.erbの修正

- GitHubにPush

```
  $ git add -A
  $ git commit -m “localized for japanese”
  $ git status
  $ git push origin master
```

### 読了の表示変更

- app/views/books/index.html.erbの修正

```
  <td><%= book.read ? '既読' : '未読' %></td>
```

- app/views/books/show.html.erbの修正

```
  <%= @book.read ? '既読' : '未読' %>
```

- GitHubにPush

```
  $ git add -A
  $ git commit -m "Chg read flag japanese"
  $ git status
  $ git push origin master
```

### アソシエーションの追加

- app/models/auther.rbの修正

```
  class Auther < ApplicationRecord
    has_many :book
  end
```

- app/models/publisher.rbの修正

```
  class Publisher < ApplicationRecord
    has_many :book
  end
```

- GitHubにPush

```
  $ git add -A
  $ git commit -m "Add Association Auther and Publisher"
  $ git status
  $ git push origin master
```

### リンクの追加

1. app/views/books/index.html.erb
2. app/views/authers/index.html.erb
3. app/views/publishers/index.html.erb

- GitHubにPush

```
  $ git add -A
  $ git commit -m "Add Link to Auther and Publisher"
  $ git status
  $ git push origin master
```


