/* eslint-disable @typescript-eslint/no-unused-vars */
import { EachMessagePayload } from "kafkajs";

interface DistributeTopics extends EachMessagePayload {}

export const distributeTopics = ({
  topic,
  message,
  partition,
}: DistributeTopics) => {
  console.log(
    "🚀 ~ distributeTopics ~ topic, message, partition:",
    topic,
    message.value?.toString(),
    partition
  );

  const messageValue = message.value;

  if (topic === "topic1" && messageValue !== null) {
    console.log(
      "🚀 ~ distributeTopics ~ topic:",
      topic,
      "messageValue",
      messageValue.toString()
    );
  }
};
