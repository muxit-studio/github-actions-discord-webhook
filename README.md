# Discord Webhook for Github Actions

1. In Github secrets, add a `WEBHOOK_URL` variable with the Discord web hook URL
2. In your Github actions yml file, add this to reference the variable you just created:
    ```yaml
        - name: Send Discord Webhook Notification
          if: always()
          env:
            JOB_STATUS: ${{ job.status }}
            WEBHOOK_URL: ${{ secrets.WEBHOOK_URL }}
            HOOK_OS_NAME: ${{ runner.os }}
            WORKFLOW_NAME: ${{ github.workflow }}
          run: |
            git clone https://github.com/muxit-studio/github-actions-discord-webhook.git discord-webhook
            bash discord-webhook/send.sh $JOB_STATUS $WEBHOOK_URL
          shell: bash
    ```
3. Enjoy!
