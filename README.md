# que-locks issue 3 demo

See https://github.com/airhorns/que-locks/issues/3.

## Setup

```bash
bundle
docker-compose up -d db
./scripts/migrate-db
```

## Run

Run this test script to enqueue 200 jobs, wait for them all to finish executing, and output the results:

```bash
./scripts/test-job-serialisation
```

and at the same time, in other terminals, either:

- Run a single multi-threaded worker to demonstrate the bug

    ```bash
    ./bin/worker-10
    ```

- Run multiple single-threaded workers to demonstrate correct behaviour

    ```bash
    ./bin/worker-1
    ```

    ```bash
    ./bin/worker-1
    ```

The test script will output the final bank account balances, which should each be 100.
