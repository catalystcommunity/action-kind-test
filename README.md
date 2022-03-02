<!-- start title -->

# GitHub Action:Hello World

<!-- end title -->
<!-- start description -->

Greet someone

<!-- end description -->
<!-- start contents -->
<!-- end contents -->
<!-- start usage -->

```yaml
- uses: catalystsquad/action-composite-action-template@undefined
  with:
    # Who to greet
    # Default: World
    who-to-greet: ""
```

<!-- end usage -->
<!-- start inputs -->

| **Input**          | **Description** | **Default** | **Required** |
| :----------------- | :-------------- | :---------: | :----------: |
| **`who-to-greet`** | Who to greet    |   `World`   |   **true**   |

<!-- end inputs -->
<!-- start outputs -->

| **Output**      | **Description** | **Default** | **Required** |
| :-------------- | :-------------- | ----------- | ------------ |
| `random-number` | Random number   |             |              |

<!-- end outputs -->
<!-- start examples -->

### Example usage

```yaml
name: Pull Request
on:
  pull_request:
    branches:
      - main
jobs:
  test:
    name: Test
    if: github.event.pull_request.draft == false
    runs-on: ubuntu-latest
    env:
      GIT_PAT: ${{ secrets.AUTOMATION_PAT }}
    steps:
      - name: Dump Context
        uses: crazy-max/ghaction-dump-context@v1
      - name: Run Tests
        uses: catalystsquad/action-kind-test@v1
        with:
          token: ${{ secrets.AUTOMATION_PAT }}
          ref: ${{ github.ref }}
          project-id: ${{ secrets.GCLOUD_PROJECT_ID_PROD }}
          credentials-json: ${{ secrets.GAR_WRITE_SERVICE_ACCOUNT_KEY }}
          wait-for-ports: 8080,8081
          dependencies: service-example-service
          add-private-helm-repo: 'true'
          helm-repo-name: your-repo-here
          helm-repo-username: ${{ secrets.AUTOMATION_PAT }}
          helm-repo-password: ${{ secrets.AUTOMATION_PAT }}
```

<!-- end examples -->
<!-- start [.github/ghdocs/examples/] -->
<!-- end [.github/ghdocs/examples/] -->
