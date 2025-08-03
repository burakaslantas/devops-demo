# 1 – Resmi, hafif Nginx imajı
FROM nginx:1.27-alpine

# 2 – Commit hash’i sonradan doldurmak için
ARG COMMIT_SHA=local
ENV COMMIT_SHA=$COMMIT_SHA

# 3 – Statik dosyayı kopyala
COPY index.html /usr/share/nginx/html/index.html

# 4 – Sağlık kontrolü (Grafana’da da gözükür)
HEALTHCHECK CMD wget -qO- http://localhost:80 || exit 1

