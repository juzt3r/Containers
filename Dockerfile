# Bruk .NET SDK for bygging
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["UptimeAPI/UptimeAPI.csproj", "UptimeAPI/"]
RUN dotnet restore "UptimeAPI/UptimeAPI.csproj"
COPY . .
WORKDIR "/src/UptimeAPI"
RUN dotnet build "UptimeAPI.csproj" -c Release -o /app/build

# Publiser applikasjonen
FROM build AS publish
RUN dotnet publish "UptimeAPI.csproj" -c Release -o /app/publish

# Kjør applikasjonen
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "UptimeAPI.dll"]