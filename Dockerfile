FROM mcr.microsoft.com/dotnet/sdk:9.0

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY repo/ .

RUN git init

RUN dotnet restore ElectronBot.Braincase.sln || true

CMD ["bash"]
