# ビルドステージ
FROM gradle:jdk17 AS build

# Lambda web adapter
COPY --from=public.ecr.aws/awsguru/aws-lambda-adapter:0.5.0 /lambda-adapter /opt/extensions/lambda-adapter

# プロジェクトの依存ファイルをコピー
COPY --chown=gradle:gradle . /home/gradle/src

# ワーキングディレクトリを設定
WORKDIR /home/gradle/src

# プロジェクトをビルド
RUN gradle clean build --no-daemon

# 実行ステージ
FROM amazoncorretto:17

# ビルドステージからビルドされたJARファイルをコピー
COPY --from=build /home/gradle/src/build/libs/*.jar app.jar

# アプリケーションを起動
ENTRYPOINT ["java", "-jar", "/app.jar"]
