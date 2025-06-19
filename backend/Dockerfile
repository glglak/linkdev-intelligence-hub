FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["LinkDevIntelligence.API/LinkDevIntelligence.API.csproj", "LinkDevIntelligence.API/"]
RUN dotnet restore "LinkDevIntelligence.API/LinkDevIntelligence.API.csproj"
COPY . .
WORKDIR "/src/LinkDevIntelligence.API"
RUN dotnet build "LinkDevIntelligence.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "LinkDevIntelligence.API.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
RUN mkdir -p /app/logs
RUN apt-get update && apt-get install -y curl
ENTRYPOINT ["dotnet", "LinkDevIntelligence.API.dll"]