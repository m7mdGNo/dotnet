# Stage 1: Build the application
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["Sports.csproj", "./"]
RUN dotnet restore "./Sports.csproj"
COPY . .  # Copies the source files
RUN dotnet publish "Sports.csproj" -c Release -o /app/publish

# Stage 2: Create the runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .  # Use only the published output
ENTRYPOINT ["dotnet", "Sports.dll"]
